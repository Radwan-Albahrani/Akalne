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

  @override
  Widget build(BuildContext context) {
    return ref.watch(menuItemsProvider).when(
          data: (data) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, bottom: 10),
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
                            children:  [
                              Text(
                                "Available Meals",
                                style:
                                    TextStyle(fontSize: 12.sp, color: Colors.grey),
                              ),
                            ],
                          ),
                           SizedBox(
                            height: 10.h,
                          ),
                          ToggleSwitch(
                            items: const ["Near Me", "Recent"],
                            onChanged: (value) {
                              print('switched to: $value');
                            },
                          ),
                        ],
                      ),
                    ),
                    data.isEmpty
                        ? const ErrorText(error: "No data")
                        : Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                return FoodItemCard(
                                  menuItemModel: data[index].menuItem,
                                  createdAt: data[index].createdAt,
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Loader(),
          error: (error, stack) => ErrorText(error: error.toString()),
        );
  }
}
