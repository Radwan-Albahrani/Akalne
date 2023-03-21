import 'package:akalne/common/features/auth/screens/user_signin_screen.dart';
import 'package:akalne/theme/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Palette.lightModeAppTheme,
      home: const UserSignInScreen(),
    );
  }
}
