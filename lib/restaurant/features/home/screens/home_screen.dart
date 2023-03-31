import 'package:akalne/restaurant/features/food/screens/published_meals_screen.dart';
import 'package:akalne/restaurant/features/menu/screens/restaurant_menu_screen.dart';
import 'package:akalne/restaurant/features/menu/screens/widgets/add_dialog.dart';
import 'package:akalne/restaurant/features/orders/screens/restaurant_orders_screen.dart';
import 'package:akalne/restaurant/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import '../../../../theme/app_colors.dart';

class RestaurantHomeScreen extends ConsumerStatefulWidget {
  const RestaurantHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<RestaurantHomeScreen> {
  var _selectedIndex = 0;

  var screens = [
    const PublishedMealsScreen(),
    const RestaurantMenuScreen(),
    const RestaurantOrdersScreen(),
    const RestaurantProfileScreen(),
  ];
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  void showDialogHandler() {
    showDialog(
        context: context, builder: (BuildContext context) => const AddDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 70.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            gap: 16,
            activeColor: AppColors.light['primary'],
            color: Colors.grey[400]!,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: AppColors.light['primaryTransparent'],
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                iconSize: 35.sp,
              ),
              GButton(
                icon: Icons.restaurant_menu_sharp,
                iconSize: 35.sp,
              ),
              GButton(
                icon: Icons.shopping_basket_outlined,
                iconSize: 35.sp,
              ),
              GButton(
                icon: Icons.person_outline,
                iconSize: 35.sp,
              ),
            ],
            selectedIndex: 0,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              backgroundColor: AppColors.light['primary'],
              onPressed: showDialogHandler,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}
