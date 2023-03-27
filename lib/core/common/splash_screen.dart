import 'package:akalne/core/constants/app_constants.dart';
import 'package:akalne/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light['primary'],
      body: Center(
        child: Image.asset(
          AppConstants.logo,
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
