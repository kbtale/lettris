import 'package:flutter/material.dart';

class NeumorphicStyles {
  static List<BoxShadow> get concaveBoxShadow => [
        BoxShadow(
          color: const Color(0xFF1C1E26).withValues(alpha: 0.7),
          offset: const Offset(5, 5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: const Color(0xFF3E4658).withValues(alpha: 0.5),
          offset: const Offset(-5, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ];
 
  static List<BoxShadow> get convexBoxShadow => [
        BoxShadow(
          color: const Color(0xFF3E4658).withValues(alpha: 0.5),
          offset: const Offset(5, 5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: const Color(0xFF1C1E26).withValues(alpha: 0.7),
          offset: const Offset(-5, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ];
 
  static Gradient get backgroundGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF323846),
          Color(0xFF2D323F),
          Color(0xFF252934),
        ],
      );
}
