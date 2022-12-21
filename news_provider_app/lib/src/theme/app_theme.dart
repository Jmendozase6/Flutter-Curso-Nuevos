import 'package:flutter/material.dart';

const Color primaryColor = Colors.blueAccent;
const Color secondaryColor = Colors.black87;

final appTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
);
