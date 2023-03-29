import 'package:flutter/material.dart';
import "./design_constants.dart";
import "./app_colors.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

// TODO: Add dark mode theme
class Palette {
  static final lightModeAppTheme = ThemeData(
    fontFamily: DesignConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.light['background'],
    primaryColor: AppColors.light['primary'],
    canvasColor: Colors.transparent,
    colorScheme: ColorScheme.light(
      primary: AppColors.light['primary'],
      onPrimary: AppColors.light['string1'],
      secondary: AppColors.light['secondary'],
      onSecondary: AppColors.light['string2'],
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.light['string1'],
        fontSize: 35.sp,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(fontSize: 6.sp, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.light['secondary']),
      displayLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
      labelLarge: TextStyle(fontSize: 20.sp, color: Colors.white),
    ),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light['primary'],
      elevation: 0,
    ),
  );
}
