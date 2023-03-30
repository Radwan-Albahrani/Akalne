import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/restaurant/features/orders/screens/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';

class RestaurantOrdersScreen extends ConsumerStatefulWidget {
  const RestaurantOrdersScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantOrdersScreenState();
}

class _RestaurantOrdersScreenState
    extends ConsumerState<RestaurantOrdersScreen> {
  final _searchController = TextEditingController();
  RestaurantModel? _restaurant;

  @override
  void initState() {
    _restaurant = ref.read(restaurantProvider);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text('Hey ${_restaurant!.name}')),
            const SizedBox(
              height: 10,
            ),
            RoundedSearchField(
              hintText: "Search",
              obscureText: false,
              controller: _searchController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Orders',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const OrderTile()
          ],
        ),
      ),
    );
  }
}
