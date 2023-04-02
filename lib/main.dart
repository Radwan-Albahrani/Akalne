import 'package:akalne/core/common/splash_screen.dart';
import 'package:akalne/core/models/restaurant_model.dart';
import 'package:akalne/core/models/user_model.dart';
import 'package:akalne/recipient/features/home/screens/home_screen.dart';
import 'package:akalne/restaurant/features/home/screens/home_screen.dart';
import 'package:akalne/restaurant/features/orders/screens/widgets/view_user_profile.dart';
import 'package:akalne/restaurant/features/profile/screens/edit_restaurant_profile.dart';
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
  Future<void> getData(WidgetRef ref, User data, BuildContext context) async {
    var authController = ref.read(authControllerProvider.notifier);
    await authController.getUserData(data.uid, context);
    restaurantModel = ref.read(restaurantProvider);
    userModel = ref.read(userProvider);
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
                  data: (data) => data != null
                      ? FutureBuilder(
                          future: getData(ref, data, context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (restaurantModel != null) {
                                return const RestaurantHomeScreen();
                              }
                              if (userModel != null) {
                                return const UserHomeScreen();
                              }
                            }
                            return const SplashScreen();
                          },
                        )
                      : const LoginScreen(),
                  error: (error, stackTrace) =>
                      ErrorText(error: error.toString()),
                  loading: () {
                    return const Loader();
                  },
                ),
            routes: {
              AppRoutes.loginScreen: (context) => const LoginScreen(),
              AppRoutes.signUpScreen: (context) => const SignUpScreen(),
              AppRoutes.editResturantScreen: (context) =>
                  EditRestaurantProfileScreen(
                    restaurantModel: ModalRoute.of(context)?.settings.arguments
                        as RestaurantModel,
                  ),
            });
      },
    );
  }
}
