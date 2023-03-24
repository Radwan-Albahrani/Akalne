import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../recipient/models/restaurant_model.dart';
import '../../../../recipient/models/user_model.dart';
import '../../../providers/storage_repository_provider.dart';
import '../../../utils.dart';
import '../repository/auth_repository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);
final restaurantProvider = StateProvider<RestaurantModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
    storageRepository: ref.watch(storageRepositoryProvider),
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  AuthController(
      {required AuthRepository authRepository,
      required Ref ref,
      required StorageRepository storageRepository})
      : _authRepository = authRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  Stream<User?> get authStateChange => _authRepository.authStateChange;

  Future<void> getUserData(String uid , BuildContext context) async {
    var data = await _authRepository.getUserData(uid);
    data.fold(
      (l)  => print(l.message),
      (r) => r.fold(
        (user) {
          _ref.read(userProvider.notifier).update((state) => user);
        },
        (restaurant) => _ref
            .read(restaurantProvider.notifier)
            .update((state) => restaurant),
      ),
    );
  }

  void signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber,
      required BuildContext context}) async {
    state = true;

    final user = await _authRepository.signUpWithEmail(
        email: email, password: password, name: name, phoneNumber: phoneNumber);

    state = false;
    user.fold(
        (l) => showSnackBar(
              context,
              l.message,
            ), (userModel) {
      _ref.read(userProvider.notifier).update((state) => userModel);
      print(userModel);
      Navigator.pop(context);
    });
  }

  void signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true;
    final user =
        await _authRepository.signInWithEmail(email: email, password: password);

    state = false;
    user.fold(
      (l) => showSnackBar(
        context,
        l.message,
      ),
      (userModel) {
        userModel.fold(
          (restaurant) =>
              _ref.read(userProvider.notifier).update((state) => restaurant),
          (user) =>
              _ref.read(restaurantProvider.notifier).update((state) => user),
        );
      },
    );
  }

  void logout() {
    _authRepository.logout();
    _ref.read(userProvider.notifier).update((state) => null);
    _ref.read(restaurantProvider.notifier).update((state) => null);
  }
}
