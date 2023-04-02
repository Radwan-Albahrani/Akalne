import 'dart:io';

import 'package:akalne/restaurant/features/profile/repository/restaurant_profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../core/providers/storage_repository_provider.dart';
import '../../../../core/utils.dart';

final restaurantProfileControllerProvider =
    StateNotifierProvider<RestaurantProfileController, bool>((ref) {
  return RestaurantProfileController(
    restaurantProfileRepository: ref.watch(
      restaurantProfileRepositoryProvider,
    ),
    ref: ref,
    storageRepository: ref.watch(storageRepositoryProvider),
  );
});

class RestaurantProfileController extends StateNotifier<bool> {
  final RestaurantProfileRepository _restaurantProfileRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  RestaurantProfileController(
      {required RestaurantProfileRepository restaurantProfileRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _restaurantProfileRepository = restaurantProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void updateRestaurantProfile({
    required String restaurantName,
    required String restaurantAddress,
    required String restaurantPhone,
    required File? restaurantLogo,
    required File? restaurantImage,
    required BuildContext context,
  }) async {
    state = true;
    String imagePath = "";
    String logoPath = "";
    final restaurant = _ref.read(restaurantProvider)!;

    if (restaurantImage != null) {
      if (restaurantImage.path.isNotEmpty) {
        final res = await _storageRepository.storeFile(
          file: restaurantImage,
          path: "restaurants/images",
          id: restaurant.id!,
        );

        res.fold(
          (l) => showSnackBar(context, l.message),
          (r) => imagePath = r,
        );
      }
    }
    if (restaurantLogo != null) {
      if (restaurantLogo.path.isNotEmpty) {
        final res = await _storageRepository.storeFile(
          file: restaurantLogo,
          path: "restaurants/logos",
          id: restaurant.id!,
        );

        res.fold(
          (l) => showSnackBar(context, l.message),
          (r) => logoPath = r,
        );
      }
    }

    final res = await _restaurantProfileRepository.updateRestaurantProfile(
      restaurantName: restaurantName,
      restaurantAddress: restaurantAddress,
      restaurantPhone: restaurantPhone,
      restaurantLogo: logoPath,
      restaurantImage: imagePath,
      restaurantId: restaurant.id!,
    );

    state = false;

    res.fold(
      (l) {
        showSnackBar(context, l.message);
      },
      (r) {
        getRestaurantProfile(restaurant.id!);
        showSuccessSnackBar(context, "Restaurant Profile Updated Successfully");
        Navigator.pop(context);
      },
    );
  }

  void getRestaurantProfile(String id) async {
    state = true;
    final res = await _restaurantProfileRepository.getRestaurantProfile(id);
    state = false;

    res.fold(
      (l) {},
      (r) {
        _ref.read(restaurantProvider.notifier).update((state) => state = r);
      },
    );
  }
}
