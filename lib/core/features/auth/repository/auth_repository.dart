import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/recipient/models/restaurant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../recipient/models/user_model.dart';
import '../../../constants/firebase_constants.dart';
import '../../../failure.dart';
import '../../../providers/firebase_providers.dart';
import '../../../type_defs.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository(
      {required FirebaseFirestore firestore, required FirebaseAuth auth})
      : _firestore = firestore,
        _auth = auth;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);
  CollectionReference get _userType =>
      _firestore.collection(FirebaseConstants.userTypeCollection);
  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required String phoneNumber}) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final userId = authResult.user!.uid;

      UserModel userModel = UserModel(
          id: userId,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          profilePictureUrl: AppConstants.defaultProfile);

      await _users.doc(userId).set(userModel.toMap());
      await _userType.doc(userId).set({'type': 'user'});

      print(userModel.toMap());
      Future.delayed(const Duration(seconds: 1));
      return Right(userModel);
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<Either<UserModel, RestaurantModel>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final userId = authResult.user!.uid;

      String type = await getUserType(userId);
      var userInfo = await getUserData(userId);
      RestaurantModel? restaurantModel;
      UserModel? userModel;
      userInfo.fold(
          (l) => print(l),
          (userData) => userData.fold((user) => userModel = user,
              (restaurant) => restaurantModel = restaurant));
      if (userModel != null) {
        return Right(Left(userModel!));
      } else {
        return Right(Right(restaurantModel!));
      }
    } on FirebaseAuthException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<Either<UserModel, RestaurantModel>> getUserData(
      String uid) async {
    try {
      print("here");
      var type = await getUserType(uid);
      print(type);
      if (type == "user") {
        var event = await _users.doc(uid).get();
        print(event.data());
        return Right(
            Left(UserModel.fromMap(event.data() as Map<String, dynamic>)));
      } else {
        var event = await _restaurants.doc(uid).get();
        return Right(Right(
            RestaurantModel.fromJson(event.data() as Map<String, dynamic>)));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<String> getUserType(String uid) {
    return _userType.doc(uid).get().then((value) {
      if(value.data() == null) {
        return "user";
      }
      final data = value.data() as Map<String, dynamic>;
      return data['type'];
    } );
  }

  void logout() async {
    await _auth.signOut();
  }
}
