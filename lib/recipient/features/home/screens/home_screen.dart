import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homeMenu/screens/home_recipient.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<UserHomeScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  var _selectedIndex = 0;

  var Screens = [
    const HomeRecipient(),
    const Center(child: Text("Favorite")),
    const Center(child: Text("Cart")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_selectedIndex],
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
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                iconSize: 35,
              ),
              GButton(
                icon: Icons.person_outline,
                iconSize: 35,
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
    );
  }
}
