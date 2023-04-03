import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/order_model.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/restaurant/features/orders/screens/widgets/order_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/error.text.dart';
import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import '../controller/orders_controller.dart';

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

  Future<void> getUserInformation(List<OrderModel> data) async {
    var controller = ref.read(ordersControllerProvider.notifier);
    for (var element in data) {
      UserModel? user = await controller.getUser(element.userId, context);
      if (user != null) {
        element.user = user;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(restaurantOrdersProvider).when(
          data: (data) => FutureBuilder(
            future: getUserInformation(data),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text('Hey ${_restaurant!.name}')),
                      SizedBox(
                        height: 10.h,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      data.isEmpty
                          ? const Text('No orders yet')
                          : Expanded(
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return OrderTile(
                                    order: data[index],
                                  );
                                },
                              ),
                            )
                    ]),
                  ),
                );
              } else {
                return const Loader();
              }
            },
          ),
          loading: () => const Loader(),
          error: (error, stack) => ErrorText(
            error: error.toString(),
          ),
        );
  }
}
