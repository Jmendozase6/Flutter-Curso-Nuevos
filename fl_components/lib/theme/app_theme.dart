import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Primary color
    primaryColor: primaryColor,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),

    //TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primaryColor),
    ),

    //FloatingActionsButtons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: StadiumBorder(),
      elevation: 0,
    ),

    //ElevatedButtons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        shape: const StadiumBorder(),
        elevation: 0,
      ),
    ),

    //InputDecorationTheme
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primaryColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //Primary color
    primaryColor: primaryColor,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),

    //Scaffold
    // scaffoldBackgroundColor: Colors.black,
  );
}
