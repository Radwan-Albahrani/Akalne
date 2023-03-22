import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/features/auth/controller/auth_controller.dart';

class RestuarantHomeScreen extends ConsumerStatefulWidget {
  const RestuarantHomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestuarantHomeScreenState();
}

class _RestuarantHomeScreenState extends ConsumerState<RestuarantHomeScreen> {
  void logout() {
    ref.read(authControllerProvider.notifier).logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restuarant Home'),
      ),
      body: Center(
        child: TextButton(onPressed: logout, child: Text('logout')),
      ),
    );
    ;
  }
}
