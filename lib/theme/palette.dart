import 'package:flutter/material.dart';
import "./design_constants.dart";
import "./app_colors.dart";

// TODO: Add dark mode theme
class Palette {
  static final lightModeAppTheme = ThemeData(
    fontFamily: DesignConstants.fontFamily,
    scaffoldBackgroundColor: AppColors.light['primary'],
    primaryColor: AppColors.light['primary'],
    canvasColor: Colors.transparent,
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      onPrimary: AppColors.light['string1'],
      secondary: AppColors.light['secondary'],
      onSecondary: AppColors.light['string2'],
    ),
    textTheme: TextTheme(
        headlineLarge: TextStyle(
          color: AppColors.light['string1'],
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium:
            const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        headlineSmall:
            const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        bodySmall: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        bodyMedium: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        bodyLarge: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        labelSmall: const TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
        labelMedium: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        displayLarge:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light['primary'],
      elevation: 0,
    ),
  );
}
