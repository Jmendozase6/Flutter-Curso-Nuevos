import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = Colors.deepPurple;

  static ThemeData lightTheme = ThemeData(
//
    fontFamily: 'Raleway',
//
  ).copyWith(
    // Primary color
    primaryColor: primaryColor,

    // Scalffold background color
    scaffoldBackgroundColor: Colors.grey[300],

    // Appbar theme
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      elevation: 0,
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 0,
    ),

    // Text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(AppTheme.primaryColor.withOpacity(0.1)),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    ),
  );
}
