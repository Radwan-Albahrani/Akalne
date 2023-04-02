import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../core/providers/storage_repository_provider.dart';
import '../../../../core/utils.dart';
import '../repository/user_profile_repository.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  return UserProfileController(
    userProfileRepository: ref.watch(userProfileRepositoryProvider),
    ref: ref,
    storageRepository: ref.watch(storageRepositoryProvider),
  );
});

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  UserProfileController(
      {required UserProfileRepository userProfileRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _userProfileRepository = userProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void updateUserProfile({
    required String userName,
    required String userPhone,
    required File? userImage,
    required BuildContext context,
  }) async {
    state = true;
    String imagePath = "";
    final user = _ref.read(userProvider)!;

    if (userImage != null) {
      final res = await _storageRepository.storeFile(
        file: userImage,
        path: "users/images",
        id: user.id,
      );

      res.fold(
        (l) => showSnackBar(context, l.message),
        (r) => imagePath = r,
      );
    }

    final res = await _userProfileRepository.updateUserProfile(
      userName: userName,
      userPhone: userPhone,
      userImage: imagePath == "" ? user.profilePictureUrl! : imagePath,
      userId: user.id,
    );

    state = false;

    res.fold(
      (l) {
        showSnackBar(context, l.message);
      },
      (r) {
        getUserProfile(userId: user.id, context: context);
        showSuccessSnackBar(context, "Profile updated successfully");
        Navigator.of(context).pop();
      },
    );
  }

  void getUserProfile({
    required String userId,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _userProfileRepository.getUserProfile(userId);

    state = false;

    res.fold(
      (l) {
        showSnackBar(context, l.message);
      },
      (r) {
        _ref.read(userProvider.notifier).update((state) => r);
      },
    );
  }
}
