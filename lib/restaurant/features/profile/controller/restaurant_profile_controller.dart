import 'dart:io';

import 'package:akalne/restaurant/features/profile/repository/restaurant_profile_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/providers/storage_repository_provider.dart';
import '../../../../core/utils.dart';

final restaurnatProfileControllerProvider =
    StateNotifierProvider<RestaurnatProfileController, bool>((ref) {
  return RestaurnatProfileController(
    restaurnatProfileRepository: ref.watch(
      restaurnatProfileRepositoryProvider,
    ),
    ref: ref,
    storageRepository: ref.watch(storageRepositoryProvider),
  );
});

class RestaurnatProfileController extends StateNotifier<bool> {
  final RestaurnatProfileRepository _restaurnatProfileRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  RestaurnatProfileController(
      {required RestaurnatProfileRepository restaurnatProfileRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _restaurnatProfileRepository = restaurnatProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void updateRestaurantProfile({
    required String restaurantName,
    required String restaurantAddress,
    required String restaurantPhone,
    required File restaurantLogo,
    required File restaurantImage,
    required BuildContext context,
  }) async {
    state = true;
    String imagePath = "";
    String logoPath = "";
    final restaurant = _ref.read(restaurantProvider)!;

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

    final res = await _restaurnatProfileRepository.updateRestaurantProfile(
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
    final res = await _restaurnatProfileRepository.getRestaurantProfile(id);
    state = false;

    res.fold(
      (l) {},
      (r) {
        _ref.read(restaurantProvider.notifier).update((state) => state = r);
      },
    );
  }
}
