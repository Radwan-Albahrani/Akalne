// final restaurnatProfileRepositoryProvider = Provider((ref) {
//   return RestaurnatProfileRepository(firestore: ref.watch(firestoreProvider));
// });

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';

final userProfileRepositoryProvider = Provider((ref) {
  return UserProfileRepository(firestore: ref.watch(firestoreProvider));
});

class UserProfileRepository {
  final FirebaseFirestore _firestore;
  UserProfileRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  FutureVoid updateUserProfile({
    required String userName,
    required String userPhone,
    required String userImage,
    required String userId,
  }) async {
    try {
      await _users.doc(userId).update({
        "name": userName,
        "phoneNumber": userPhone,
        "profilePictureUrl": userImage,
      });
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? "Something went wrong"));
    }
  }


  FutureEither<UserModel> getUserProfile(String userId) async {
    try {
      final res = await _users.doc(userId).get();
      return Right(UserModel.fromJson(res.data()! as Map<String, dynamic>));
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? "Something went wrong"));
    }
  }
}
