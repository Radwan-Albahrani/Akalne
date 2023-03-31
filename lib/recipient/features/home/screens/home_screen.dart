import 'package:akalne/recipient/features/Profile/screens/profile_screen.dart';
import 'package:akalne/recipient/features/orders/screens/orders_screen.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homeMenu/screens/home_recipient.dart';

class UserHomeScreen extends ConsumerStatefulWidget {
  const UserHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<UserHomeScreen> {
  var _selectedIndex = 0;

  var screens = [
    const HomeRecipient(),
    const OrdersPage(),
    const ProfileScreen(),
  ];

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
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 32, right: 32),
          child: GNav(
            gap: 16,
            activeColor: AppColors.light['primary'],
            color: Colors.grey[400]!,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            duration: const Duration(milliseconds: 800),
            tabBackgroundColor: AppColors.light['primaryTransparent'],
            tabs:  [
              GButton(
                icon: Icons.home_outlined,
                iconSize: 35.sp,
              ),
              GButton(
                icon: Icons.access_time_rounded,
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
    );
  }
}
