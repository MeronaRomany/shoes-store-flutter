import 'package:flutter/material.dart';

import '../app_color.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.grey900,
        iconTheme: IconThemeData(
        color: AppColors.grey900, // لون الأيقونات
      ),
    ),
    scaffoldBackgroundColor: AppColors.grey900,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary0,
      brightness: Brightness.dark,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey0,
      displayColor: AppColors.grey0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:AppColors.grey800,
      // selectedItemColor: AppColors.primary25,
      selectedIconTheme: IconThemeData(color: Colors.blueAccent),
      unselectedIconTheme: IconThemeData(color: AppColors.grey300),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      splashColor: Colors.white,
      elevation: 8, // ✅ تعطي عمقًا للزر
      //
    ),

    listTileTheme: ListTileThemeData(
      leadingAndTrailingTextStyle: TextStyle(color: Colors.white),
      subtitleTextStyle: TextStyle(color: Colors.white),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey100),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey100),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary200),
      ),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.darkFillColor;
        }
        return AppColors.grey800;
      }),
      filled: true,
    ),
    cardColor: Colors.white,
    
  );
}
