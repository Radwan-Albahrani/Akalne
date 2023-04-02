import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/models/restaurant_model.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';

final restaurantProfileRepositoryProvider = Provider((ref) {
  return RestaurantProfileRepository(firestore: ref.watch(firestoreProvider));
});

class RestaurantProfileRepository {
  final FirebaseFirestore _firestore;
  RestaurantProfileRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  FutureVoid updateRestaurantProfile(
      {required String restaurantName,
      required String restaurantAddress,
      required String restaurantPhone,
      required String restaurantLogo,
      required String restaurantImage,
      required String restaurantId}) async {
    try {
      if (restaurantLogo == "" && restaurantImage == "") {
        await _restaurants.doc(restaurantId).update({
          "name": restaurantName,
          "address": restaurantAddress,
          "phone": restaurantPhone,
        });
      } else if (restaurantLogo == "") {
        await _restaurants.doc(restaurantId).update({
          "name": restaurantName,
          "address": restaurantAddress,
          "phone": restaurantPhone,
          "restaurantImage": restaurantImage,
        });
      } else if (restaurantImage == "") {
        await _restaurants.doc(restaurantId).update({
          "name": restaurantName,
          "address": restaurantAddress,
          "phone": restaurantPhone,
          "restaurantLogo": restaurantLogo,
        });
      } else {
        await _restaurants.doc(restaurantId).update({
          "name": restaurantName,
          "address": restaurantAddress,
          "phone": restaurantPhone,
          "restaurantLogo": restaurantLogo,
          "restaurantImage": restaurantImage,
        });
      }
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? "Something went wrong"));
    }
  }

  FutureEither<RestaurantModel> getRestaurantProfile(
      String restaurantId) async {
    try {
      final res = await _restaurants.doc(restaurantId).get();
      return Right(
          RestaurantModel.fromJson(res.data()! as Map<String, dynamic>));
    } on FirebaseException catch (e) {
      return Left(Failure(e.message ?? "Something went wrong"));
    }
  }
}
