import 'package:akalne/core/common/error.text.dart';
import 'package:akalne/core/common/loader.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/restaurant/features/menu/screens/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../recipient/features/homeMenu/screens/widgets/rounded_search_field.dart';
import '../controller/menu_controller.dart';

class RestaurantMenuScreen extends ConsumerStatefulWidget {
  const RestaurantMenuScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends ConsumerState<RestaurantMenuScreen> {
  late final TextEditingController _searchController;
  RestaurantModel? restaurantModel;

  @override
  void initState() {
    _searchController = TextEditingController();
    restaurantModel = ref.read(restaurantProvider);

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(menuItemsProvider).when(
        data: (data) {
          print(data);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Hey ${restaurantModel!.name}')),
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
                      'Food Menu',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 152.h,
                          childAspectRatio: 1,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 40,
                        ),
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return SizedBox(
                              width: 120.w,
                              height: 152.h,
                              child: MenuItem(menuItemModel: data[index]));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Loader(),
        error: (error, stack) => ErrorText(error: error.toString()));
  }
}
