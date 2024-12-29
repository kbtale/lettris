import 'package:flutter/material.dart';

class NeumorphicStyles {
  static List<BoxShadow> get concaveBoxShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(5, 5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.blue.withOpacity(0.1),
          offset: const Offset(-5, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ];

  static List<BoxShadow> get convexBoxShadow => [
        BoxShadow(
          color: Colors.blue.withOpacity(0.1),
          offset: const Offset(5, 5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(-5, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ];

  static Gradient get backgroundGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade900.withOpacity(0.8),
          Colors.blue.shade800.withOpacity(0.7),
          Colors.blue.shade700.withOpacity(0.6),
        ],
      );
}
