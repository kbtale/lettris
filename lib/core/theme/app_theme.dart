import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFF0A1929),
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.lightBlue,
        surface: Color(0xFF162033),
        background: Color(0xFF0A1929),
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 8,
          shadows: [
            Shadow(
              color: Colors.blue,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.9),
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white.withOpacity(0.8),
          letterSpacing: 0.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
