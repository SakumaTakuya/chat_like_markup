import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorScheme.light(
        primary: Colors.white,
        primaryVariant: Colors.blueGrey[200],
        secondary: Colors.indigo,
        secondaryVariant: Colors.indigo[700],
        surface: Colors.white,
        background: Colors.blueGrey[50],
        onPrimary: Colors.blueGrey[900],
        onSecondary: Colors.white,
        onSurface: Colors.blueGrey[900],
        onBackground: Colors.blueGrey[900],
      ),
    );
  }
}
