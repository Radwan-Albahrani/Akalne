import 'package:akalne/core/utils.dart';
import 'package:akalne/restaurant/features/orders/repository/orders_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../core/models/order_model.dart';

final ordersControllerProvider = StateNotifierProvider<OrdersController, bool>(
  (ref) => OrdersController(
    orderRepository: ref.watch(ordersRepositoryProvider),
    ref: ref,
  ),
);

final restaurantOrdersProvider = StreamProvider((ref) {
  final controller = ref.watch(ordersControllerProvider.notifier);
  return controller.getOrdersByResturantId();
});

class OrdersController extends StateNotifier<bool> {
  final OrderRepository _orderRepository;
  final Ref _ref;

  OrdersController({
    required OrderRepository orderRepository,
    required Ref ref,
  })  : _orderRepository = orderRepository,
        _ref = ref,
        super(false);

  Stream<List<OrderModel>> getOrdersByResturantId() {
    final id = _ref.read(restaurantProvider)!.id ?? "";
    return _orderRepository.getOrdersByResturantId(id);
  }

  void changeOrderStatus({
    required OrderModel order,
    required String status,
    required BuildContext context,
    String? reason,
  }) async {
    state = true;
    final res =
        await _orderRepository.changeOrderStatus(order, status, reason ?? "");
    state = false;

    res.fold(
      (l) {
        showSnackBar(context, l.message);
      },
      (r) {
        if (reason != null) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
