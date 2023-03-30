import 'package:akalne/core/constants/firebase_constants.dart';
import 'package:akalne/core/failure.dart';
import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/core/providers/firebase_providers.dart';
import 'package:akalne/core/type_defs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final homeMenuRepositoryProvider = Provider((ref) {
  return HomeMenuRepository(firestore: ref.watch(firestoreProvider));
});

class HomeMenuRepository {
  final FirebaseFirestore _firestore;
  HomeMenuRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _menu =>
      _firestore.collection(FirebaseConstants.publishedMealsCollection);
  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);
  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  CollectionReference get _orderCount =>
      _firestore.collection(FirebaseConstants.orderCountCollection);

  Stream<List<PublishedMealModel>> getMenuItems() {
    return _menu.orderBy("createdAt", descending: true).snapshots().map(
        (event) => event.docs
            .map((e) =>
                PublishedMealModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }

  Future<List<PublishedMealModel>> getMenuItemsByID(String id) async {
    return _restaurants
        .doc(id)
        .collection(FirebaseConstants.publishedMealsCollection)
        .orderBy("createdAt", descending: true)
        .get()
        .then((value) => value.docs
            .map((e) => PublishedMealModel.fromJson(e.data()))
            .toList());
  }

  FutureVoid reserveMeal(OrderModel order) async {
    try {
      // 1. Add order to user's orders collection
      await _users
          .doc(order.user.id)
          .collection(FirebaseConstants.ordersCollection)
          .doc(order.id.toString())
          .set(order.toJson());
      // 2. Add order to restaurant's orders collection
      await _restaurants
          .doc(order.restaurantID)
          .collection(FirebaseConstants.ordersCollection)
          .doc(order.id.toString())
          .set(order.toJson());
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<int> getOrdersCount() async {
    try {
      return Right(await _orderCount.doc("orderCount").get().then((value) {
        final data = value.data() as Map<String, dynamic>;
        return data["count"] as int;
      }));
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureVoid increaseOrderCount(int count) async {
    try {
      await _orderCount.doc("orderCount").update({"count": count + 1});
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
