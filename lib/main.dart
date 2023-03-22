import 'package:akalne/recipient/features/feature/home/screens/home_screen.dart';
import 'package:akalne/recipient/models/restaurant_model.dart';
import 'package:akalne/recipient/models/user_model.dart';
import 'package:akalne/restuarant/features/feature/home/screens/home_screen.dart';
import 'package:akalne/theme/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/common/error.text.dart';
import 'core/common/loader.dart';
import 'core/constants/app_routes.dart';
import 'core/features/auth/controller/auth_controller.dart';
import 'core/features/auth/screens/sign_up_screen.dart';
import 'firebase_options.dart';
import './core/features/auth/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  RestaurantModel? restaurantModel;
  UserModel? userModel;
  void getData(WidgetRef ref, User data) async {
    setState(() {
      restaurantModel = null;
      userModel = null;
    });
    await ref.watch(authControllerProvider.notifier).getUserData(data.uid);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            title: 'Akalne',
            theme: Palette.lightModeAppTheme,
            debugShowCheckedModeBanner: false,
            home: ref.watch(authStateChangeProvider).when(
                  data: (data) {
                    if (data != null) {
                      getData(ref, data);
                      restaurantModel = ref.watch(restaurantProvider);
                      userModel = ref.watch(userProvider);
                      if (restaurantModel != null) {
                        print("Restaurant");
                        return const RestaurantHomeScreen();
                      }
                      if (userModel != null) {
                        print("User");
                        return const UserHomeScreen();
                      }
                    }
                    return const LoginScreen();
                  },
                  error: (error, stackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () => const Loader(),
                ),
            routes: {
              AppRoutes.loginScreen: (context) => const LoginScreen(),
              AppRoutes.signUpScreen: (context) => const SignUpScreen(),
            });
      },
    );
  }
}
