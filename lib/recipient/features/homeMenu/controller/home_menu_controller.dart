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
import 'package:fpdart/fpdart.dart';
import 'package:uuid/uuid.dart';

final homeMenuControllerProvider =
    StateNotifierProvider<HomeMenuController, bool>((ref) => HomeMenuController(
          ref: ref,
          homeMenuRepository: ref.watch(homeMenuRepositoryProvider),
        ));

// Provider to get menu items as a stream
final menuItemsProvider = StreamProvider((ref) {
  final controller = ref.watch(homeMenuControllerProvider.notifier);
  return controller.getMenuItems();
});

// Provider to get menu items by restaurant ID
final ordersProvider = StreamProvider((ref) {
  final controller = ref.watch(homeMenuControllerProvider.notifier);
  final user = ref.watch(userProvider);
  return controller.getOrders(user!.id);
});

// Controller class for UI related to home Menu
class HomeMenuController extends StateNotifier<bool> {
  // Variables
  final Ref _ref;
  final HomeMenuRepository _homeMenuRepository;

  // Constructor
  HomeMenuController({
    required Ref ref,
    required HomeMenuRepository homeMenuRepository,
  })  : _ref = ref,
        _homeMenuRepository = homeMenuRepository,
        super(false);

  // Method to get all menu items as a stream from repository
  Stream<List<PublishedMealModel>> getMenuItems() {
    return _homeMenuRepository.getMenuItems();
  }

  // Method to get all orders as a stream from repository
  Stream<List<OrderModel>> getOrders(String id) {
    return _homeMenuRepository.getOrders(id);
  }

  // Method to get all menu items by restaurant ID as a future from repository
  Future<List<PublishedMealModel>> getMenuItemsByID(String id) async {
    return _homeMenuRepository.getMenuItemsByID(id);
  }

  // Method to reserve a meal
  void reserveMeal(
      PublishedMealModel meal, int quantity, BuildContext context) async {
    // Set state to true
    state = true;

    // Get the user ID and get the orders of that user
    UserModel? user = _ref.read(userProvider);
    final userID = user!.id;
    final orderResults = await _homeMenuRepository.getLatestOrder(userID);

    // Use that to get the latest order from that user
    OrderModel? latestOrder;
    orderResults.fold((l) {
      if (l.message != "No orders found") {
        showSnackBar(context, l.message);
      }
    }, (r) => latestOrder = r);

    // If the order exists, check if its less than 24 hrs old
    if (latestOrder != null) {
      if (DateTime.now()
              .difference(DateTime.parse(latestOrder?.dateCreated as String))
              .inHours <
          24) {
        // If it is, don't allow user to order
        Future.delayed(Duration.zero, () {
          showSnackBar(
            context,
            "You can only reserve a meal once every 24 hours",
          );
        });
        state = false;
        return;
      }
    }

    // If the order doesn't exist or is more than 24 hrs old, allow user to order
    // Get order count for the order number
    final resultID = await _homeMenuRepository.getOrdersCount();

    // Set the ID to the latest order count
    int id = 0;
    bool failed = false;
    resultID.fold((l) {
      showSnackBar(context, l.message);
      failed = true;
    }, (r) => id = r);

    // If an error happens while getting the ID, show error and exit function
    if (failed) {
      return;
    }

    // Prepare order model
    OrderModel order = OrderModel(
      id: id,
      status: "Sent to Restaurant",
      dateCreated: DateTime.now().toString(),
      quantity: quantity,
      meal: meal,
      restaurantID: meal.menuItem.restaurant.id as String,
      user: user,
    );

    // Reserve the meal
    var result = await _homeMenuRepository.reserveMeal(order);
    state = false;
    result.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSuccessSnackBar(context, "Order reserved successfully");
        _homeMenuRepository.increaseOrderCount(id);
      },
    );
  }
}
