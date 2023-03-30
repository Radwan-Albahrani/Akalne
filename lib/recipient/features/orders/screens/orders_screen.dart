import 'package:akalne/core/common/error.text.dart';
import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/models/order_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return ref.watch(ordersProvider).when(data: (data) {
      Color color;
      if (data.isEmpty) {
        return const Center(
          child: Text("No orders yet"),
        );
      }
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
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    OrderModel currentOrder = data[index];
                    if (currentOrder.status == "Sent to Restaurant") {
                      color = Colors.yellow.shade700;
                    } else if (currentOrder.status == "Accepted") {
                      color = AppColors.light["primary"];
                    } else if (currentOrder.status == "Rejected") {
                      color = AppColors.light["secondary"];
                    } else {
                      color = Colors.grey;
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
    }, loading: () {
      return const Loader();
    }, error: (error, stack) {
      return ErrorText(error: error.toString());
    });
  }
}
