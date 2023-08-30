import 'package:flutter/material.dart';
import 'package:hospital/res/colors.dart';

class AppThemes {
  static final ThemeData defaultTheme = ThemeData(
      useMaterial3: true,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.primary,
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColors.primary,
        labelColor: AppColors.primary,
      ));
}
