import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFF2D323F),
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.lightBlue,
        surface: Color(0xFF2D323F),
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 8,
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white.withValues(alpha: 0.9),
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white.withValues(alpha: 0.8),
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
