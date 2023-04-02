import 'package:akalne/core/models/menu_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';

final menuRepositoryProvider = Provider((ref) {
  return MenuRepository(
    storage: ref.watch(storageProvider),
    firestore: ref.watch(firestoreProvider),
  );
});

class MenuRepository {
  final FirebaseFirestore _firestore;
  FirebaseStorage _storage;
  MenuRepository({
    required FirebaseStorage storage,
    required FirebaseFirestore firestore,
  })  : _firestore = firestore,
        _storage = storage;

  CollectionReference get _menuItems =>
      _firestore.collection(FirebaseConstants.menuItemsCollection);

  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  FutureVoid addProduct(MenuItemModel menuItem) async {
    try {
      print(menuItem.id);
      return Right(await _restaurants
          .doc(menuItem.restaurant.id)
          .collection(FirebaseConstants.menuCollection)
          .doc(menuItem.id)
          .set(menuItem.toJson()));
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Stream<List<MenuItemModel>> getRestaurantMenuItemsByID(String id) {
    return _restaurants
        .doc(id)
        .collection(FirebaseConstants.menuCollection)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => MenuItemModel.fromJson(e.data())).toList());
  }

  FutureVoid deleteProduct(String id, String restaurantId) async {
    try {
      await _menuItems.doc(id).delete();
      // await _storage.ref().child("restaurants/menu/$id").delete();
      return Right(
        _restaurants
            .doc(restaurantId)
            .collection(FirebaseConstants.menuCollection)
            .doc(id)
            .delete(),
      );
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
