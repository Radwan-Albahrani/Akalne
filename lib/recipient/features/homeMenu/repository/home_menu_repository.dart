import 'package:akalne/core/constants/firebase_constants.dart';
import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/providers/firebase_providers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeMenuRepositoryProvider = Provider((ref) {
  return HomeMenuRepository(firestore: ref.watch(firestoreProvider));
});

class HomeMenuRepository {
  final FirebaseFirestore _firestore;
  HomeMenuRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  CollectionReference get _menu =>
      _firestore.collection(FirebaseConstants.menuItemsCollection);
  CollectionReference get _restaurants =>
      _firestore.collection(FirebaseConstants.restaurantsCollection);

  Stream<List<MenuItemModel>> getMenuItems() {
    return _menu.snapshots().map((event) => event.docs
        .map((e) => MenuItemModel.fromJson(e.data() as Map<String, Object?>))
        .toList());
  }

  Future<List<MenuItemModel>> getMenuItemsByID(String id) async {
    return _restaurants
        .doc(id)
        .collection(FirebaseConstants.menuCollection)
        .get()
        .then((value) =>
            value.docs.map((e) => MenuItemModel.fromJson(e.data())).toList());
  }
}
