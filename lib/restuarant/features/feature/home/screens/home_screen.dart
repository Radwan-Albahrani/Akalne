import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/features/auth/controller/auth_controller.dart';

class RestaurantHomeScreen extends ConsumerStatefulWidget {
  const RestaurantHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<RestaurantHomeScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Home'),
      ),
      body: Center(
        child: TextButton(onPressed: logout, child: Text('logout')),
      ),
    );
    ;
  }
}
