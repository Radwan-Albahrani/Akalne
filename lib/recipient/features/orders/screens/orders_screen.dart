import 'package:akalne/core/common/error.text.dart';
import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/recipient/features/homeMenu/controller/home_menu_controller.dart';
import 'package:akalne/recipient/features/orders/screens/widgets/order_item_card.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrdersPage extends ConsumerStatefulWidget {
  const OrdersPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrdersPageState();
}

class _OrdersPageState extends ConsumerState<OrdersPage> {
  Future<void> getRestaurantInformation(List<OrderModel> data) async {
    var controller = ref.read(homeMenuControllerProvider.notifier);
    List<String> restaurantIds = [];
    for (var element in data) {
      String restaurantId = element.meal.menuItem.restaurant.id as String;
      if (restaurantIds.contains(restaurantId)) continue;
      RestaurantModel? restaurant =
          await controller.getRestaurant(restaurantId, context);
      if (restaurant != null) {
        restaurantIds.add(restaurant.id as String);
        element.meal.restaurantInfo = restaurant;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(ordersProvider).when(data: (data) {
      Color color;
      return FutureBuilder(
          future: getRestaurantInformation(data),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, bottom: 10, top: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "My Orders",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      data.isEmpty
                          ? Column(
                              children: const [
                                SizedBox(
                                  height: 100,
                                ),
                                Center(
                                  child: Text(
                                    "No Orders yet",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  OrderModel currentOrder = data[index];
                                  if (currentOrder.status ==
                                      "Sent to Restaurant") {
                                    color = Colors.yellow.shade700;
                                  } else if (currentOrder.status ==
                                      "Accepted") {
                                    color = AppColors.light["primary"];
                                  } else if (currentOrder.status ==
                                      "Rejected") {
                                    color = AppColors.light["secondary"];
                                  } else {
                                    color = Colors.grey;
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: OrderItemCard(
                                      orderModel: data[index],
                                      color: color,
                                    ),
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              );
            } else {
              return const Loader();
            }
          });
    }, loading: () {
      return const Loader();
    }, error: (error, stack) {
      return ErrorText(error: error.toString());
    });
  }
}
