import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: const Color(0xFF181818),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.redAccent));

final ThemeData darkTheme = ThemeData(
  backgroundColor: const Color(0xFF181818),
  primaryColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Color(0xFF181818),
  ),
);
