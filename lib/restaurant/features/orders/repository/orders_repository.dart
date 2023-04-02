import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';

final ordersRepositoryProvider = Provider((ref) {
  return OrderRepository(firestore: ref.watch(firestoreProvider));
});

class OrderRepository {
  final FirebaseFirestore _firestore;
  OrderRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<List<OrderModel>> getOrdersByResturantId(String Id) {
    return _restaurants
        .doc(Id)
        .collection(FirebaseConstants.ordersCollection)
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => OrderModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }

  FutureVoid changeOrderStatus(
      OrderModel order, String status, String reason) async {
    try {
      await _restaurants
          .doc(order.restaurantID)
          .collection(FirebaseConstants.ordersCollection)
          .doc(order.id.toString())
          .update(
        {"status": status, "reason": reason},
      );

      await _users
          .doc(order.userId)
          .collection(FirebaseConstants.ordersCollection)
          .doc(order.id.toString())
          .update(
        {"status": status, "reason": reason},
      );
      return const Right(null);
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  FutureEither<UserModel> getUser(String id) async {
    try {
      UserModel user = await _users.doc(id).get().then(
            (value) => UserModel.fromJson(
              value.data() as Map<String, dynamic>,
            ),
          );
      return Right(user);
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
