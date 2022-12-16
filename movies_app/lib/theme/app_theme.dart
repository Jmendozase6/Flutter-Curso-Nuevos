import 'package:flutter/material.dart';

class AppTheme {
  // static const Color primaryColor = Colors.orange;
  static const Color primaryColor = Color.fromRGBO(24, 26, 33, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Primary color
    primaryColor: primaryColor,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
  );
}
