import 'package:flutter/material.dart';

import '../app_color.dart';

ThemeData getLightTheme(){
  return ThemeData(
    scaffoldBackgroundColor:Color(0xfff8f9fa),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary200,
      brightness: Brightness.light,
    ),
    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey900,
      displayColor: AppColors.grey900,
    ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
      backgroundColor:  Colors.white,
      // selectedItemColor: AppColors.primary25,
      selectedIconTheme: IconThemeData(
      color: Colors.blueAccent,
    ),
      unselectedIconTheme:  IconThemeData(
        color: Colors.grey,
      ),

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      splashColor: Colors.black,


    ),

    listTileTheme: ListTileThemeData(
      leadingAndTrailingTextStyle: TextStyle(
        color: Colors.black,
      ),
      subtitleTextStyle:  TextStyle(
         color: Colors.black,
    )
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.grey100,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.grey100,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primary200,
        ),
      ),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.primary0;
        }
        return AppColors.grey0;
      }),
      filled: true,
    ),
    cardColor: Colors.white,

  );
 }