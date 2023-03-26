import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/core/features/auth/controller/auth_controller.dart';
import 'package:akalne/recipient/features/Profile/screens/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestuarantProfileScreen extends ConsumerStatefulWidget {
  const RestuarantProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RestuarantProfileScreenState();
}

class _RestuarantProfileScreenState extends ConsumerState<RestuarantProfileScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50,
              backgroundImage: AssetImage(AppConstants.defaultProfile),
            ),
            const SizedBox(height: 12),
            Text(
              'R1',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text(
              'r1@Akalne.com',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 12),
            ProfileTile(
              title: "Profile Information",
              icon: Icons.person,
              onTap: (){},
            ),
            ProfileTile(
              title: "Notifications",
              icon: Icons.notifications,
              onTap: (){},
            ),
            ProfileTile(
              title: "Settings",
              icon: Icons.settings,
              onTap: (){},
            ),
            ProfileTile(
              title: "Contact Us",
              icon: Icons.contact_support,
              onTap: (){},
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

