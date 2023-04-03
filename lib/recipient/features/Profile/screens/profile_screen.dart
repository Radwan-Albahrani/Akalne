import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/recipient/features/Profile/screens/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_routes.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  void navigateToEditProfile(BuildContext context, UserModel? user) {
    Navigator.of(context).pushNamed(
      AppRoutes.editUserScreen,
      arguments: user,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(userProvider);
    print(userModel);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.sp,
              backgroundImage:
                  userModel?.profilePictureUrl == AppConstants.defaultProfile
                      ? const AssetImage(AppConstants.defaultProfile)
                          as ImageProvider
                      : NetworkImage(userModel?.profilePictureUrl ?? ""),
            ),
            SizedBox(height: 10.h),
            Text(
              userModel?.name ?? "",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10.h),
            Text(
              userModel?.email ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 10.h),
            ProfileTile(
                title: "Profile Information",
                icon: Icons.person,
                onTap: () => navigateToEditProfile(context, userModel)),
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
