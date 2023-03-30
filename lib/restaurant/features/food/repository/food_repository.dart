import 'package:akalne/core/models/published_meal_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';

final foodRepositoryProvider = Provider((ref) {
  final firestore = ref.watch(firestoreProvider);
  return FoodRepository(firestore: firestore);
});

class FoodRepository {
  final FirebaseFirestore _firestore;
  FoodRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  CollectionReference get _publishedMeals =>
      _firestore.collection(FirebaseConstants.publishedMealsCollection);

  FutureVoid addPublishedMeal(PublishedMealModel meal) async {
    try {
      await _publishedMeals.doc(meal.id).set(meal.toJson());

      // ignore: void_checks
      return Right(await _restaurants
          .doc(meal.menuItem.restaurant.id)
          .collection(FirebaseConstants.publishedMealsCollection)
          .doc(meal.id)
          .set(meal.toJson()));
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Stream<List<PublishedMealModel>> getPublishedMealsByRestaurantID(String id) {
    return _restaurants
        .doc(id)
        .collection(FirebaseConstants.publishedMealsCollection)
        .snapshots()
        .map((event) => event.docs
            .map((e) => PublishedMealModel.fromJson(e.data()))
            .toList());
  }
}
