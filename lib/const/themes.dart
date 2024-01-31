import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.white,
      onPrimary: Colors.black,
      secondary: Colors.deepOrange,
      onSecondary: Colors.white),
  useMaterial3: true,
);

final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.blueGrey,
        onPrimary: Colors.white,
        secondary: Colors.blueGrey,
        onSecondary: Colors.white));