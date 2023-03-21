import 'package:akalne/core/features/auth/screens/sign_in_screen.dart';
import 'package:akalne/theme/palette.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Palette.lightModeAppTheme,
      home: const LoginScreen(),
    );
  }
}
