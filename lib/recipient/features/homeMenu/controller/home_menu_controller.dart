import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/menu_item_model.dart';
import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/core/type_defs.dart';
import 'package:akalne/core/utils.dart';
import 'package:akalne/recipient/features/homeMenu/repository/home_menu_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final homeMenuControllerProvider =
    StateNotifierProvider<HomeMenuController, bool>((ref) => HomeMenuController(
          ref: ref,
          homeMenuRepository: ref.watch(homeMenuRepositoryProvider),
        ));

final menuItemsProvider = StreamProvider((ref) {
  final controller = ref.watch(homeMenuControllerProvider.notifier);
  return controller.getMenuItems();
});

class HomeMenuController extends StateNotifier<bool> {
  final Ref _ref;
  final HomeMenuRepository _homeMenuRepository;
  HomeMenuController({
    required Ref ref,
    required HomeMenuRepository homeMenuRepository,
  })  : _ref = ref,
        _homeMenuRepository = homeMenuRepository,
        super(false);

  Stream<List<PublishedMealModel>> getMenuItems() {
    return _homeMenuRepository.getMenuItems();
  }

  Future<List<PublishedMealModel>> getMenuItemsByID(String id) async {
    return _homeMenuRepository.getMenuItemsByID(id);
  }

  void reserveMeal(
      MenuItemModel meal, int quantity, BuildContext context) async {
    state = true;
    UserModel? user = _ref.read(userProvider);
    final resultID = await _homeMenuRepository.getOrdersCount();
    int id = 0;
    resultID.fold((l) => showSnackBar(context, l.message), (r) => id = r);
    OrderModel order = OrderModel(
      id: id,
      status: "Sent to Restaurant",
      dateCreated: DateTime.now().toString(),
      quantity: quantity,
      meal: meal,
      restaurantID: meal.restaurant.id as String,
      user: user as UserModel,
    );
    var result = await _homeMenuRepository.reserveMeal(order);
    result.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSuccessSnackBar(context, "Order reserved successfully");
        _homeMenuRepository.increaseOrderCount(id);
      },
    );
  }
}
