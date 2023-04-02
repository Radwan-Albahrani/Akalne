import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/recipient/features/Profile/screens/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_routes.dart';

class RestaurantProfileScreen extends ConsumerStatefulWidget {
  const RestaurantProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantProfileScreenState();
}

class _RestaurantProfileScreenState
    extends ConsumerState<RestaurantProfileScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  void navigateToEditProfile(
      BuildContext context, RestaurantModel restaurantModel) {
    Navigator.of(context)
        .pushNamed(AppRoutes.editRestaurantScreen, arguments: restaurantModel);
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = ref.watch(restaurantProvider)!;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.sp,
              backgroundImage: NetworkImage(restaurant.restaurantLogo!),
            ),
            SizedBox(height: 10.h),
            Text(
              restaurant.name as String,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 12.h),
            Text(
              restaurant.email as String,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 10.h),
            ProfileTile(
              title: "Profile Information",
              icon: Icons.person,
              onTap: () => navigateToEditProfile(context, restaurant),
            ),
            ProfileTile(
              title: "Notifications",
              icon: Icons.notifications,
              onTap: () {},
            ),
            ProfileTile(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {},
            ),
            ProfileTile(
              title: "Contact Us",
              icon: Icons.contact_support,
              onTap: () {},
            ),
            ProfileTile(
              title: "Log out",
              icon: Icons.logout,
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }
}
