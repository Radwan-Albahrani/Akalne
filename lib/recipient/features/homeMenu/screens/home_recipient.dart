import 'package:akalne/core/models/published_meal_model.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/recipient/features/homeMenu/controller/home_menu_controller.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/food_item_card.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import 'package:akalne/recipient/features/homeMenu/screens/widgets/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/error.text.dart';
import '../../../../core/common/loader.dart';
import '../../../../core/features/auth/controller/auth_controller.dart';

class HomeRecipient extends ConsumerStatefulWidget {
  const HomeRecipient({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeRecipientState();
}

class _HomeRecipientState extends ConsumerState<HomeRecipient> {
  UserModel? userModel;

  @override
  void initState() {
    userModel = ref.read(userProvider);
    super.initState();
  }

  final _searchController = TextEditingController();

  Future<void> getRestaurantInformation(List<PublishedMealModel> data) async {
    var controller = ref.read(homeMenuControllerProvider.notifier);
    RestaurantModel? restaurant = await controller.getRestaurant(
        data[0].menuItem.restaurant.id as String, context);
    if (restaurant != null) {
      for (var element in data) {
        element.restaurantInfo = restaurant;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(menuItemsProvider).when(
          data: (data) {
            return FutureBuilder(
              future: getRestaurantInformation(data),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Scaffold(
                    body: SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hey ${userModel!.name}!",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
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
                                Row(
                                  children: [
                                    Text(
                                      "Available Meals",
                                      style: TextStyle(
                                          fontSize: 12.sp, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ToggleSwitch(
                                  items: const ["Near Me", "Recent"],
                                  onChanged: (value) {
                                    // TODO: implement
                                  },
                                ),
                              ],
                            ),
                          ),
                          data.isEmpty
                              ? const ErrorText(error: "No Published Meals yet")
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      return FoodItemCard(
                                        publishedMealModel: data[index],
                                        createdAt: data[index].createdAt,
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
              },
            );
          },
          loading: () => const Loader(),
          error: (error, stack) {
            debugPrint(error.toString());
            return ErrorText(error: error.toString());
          },
        );
  }
}
