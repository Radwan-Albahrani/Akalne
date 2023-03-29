import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/firebase_constants.dart';
import '../../../../core/failure.dart';
import '../../../../core/providers/firebase_providers.dart';
import '../../../../core/type_defs.dart';
import '../../../models/menu_item_model.dart';

final menuRepositoryProvider = Provider((ref) {
  return MenuRepository(firestore: ref.watch(firestoreProvider));
});

class MenuRepository {
  final FirebaseFirestore _firestore;
  MenuRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _menu =>
      _firestore.collection(FirebaseConstants.menuCollection);

  CollectionReference get _menuItems =>
      _firestore.collection(FirebaseConstants.menuItemsCollection);

  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  FutureVoid addProduct(MenuItemModel menuItem) async {
    try {
      await _menuItems.add(menuItem.toJson());

      // ignore: void_checks
      return Right(await _restaurants
          .doc(menuItem.restaurant.id)
          .collection(FirebaseConstants.menuCollection)
          .add(menuItem.toJson()));
    } on FirebaseException catch (e) {
      return Left(Failure(e.toString()));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // Stream<Community> getCommunityByName(String name) {
  //   return _communities.doc(name).snapshots().map((event) => Community.fromMap(event.data() as Map<String, dynamic>));
  // }

  Stream<List<MenuItemModel>> getRestaurantMenuItemsByID(String id) {
    return _restaurants
        .doc(id)
        .collection(FirebaseConstants.menuCollection)
        .snapshots()
        .map((event) => event.docs
            .map(
                (e) => MenuItemModel.fromJson(e.data() as Map<String, dynamic>))
            .toList());
  }
}
