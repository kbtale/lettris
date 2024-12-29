import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.purple.shade900,
          ],
        ),
      ),
    ).animate()
      .fadeIn(duration: const Duration(seconds: 1))
      .shimmer(duration: const Duration(seconds: 3), curve: Curves.easeInOut)
      .animate(onPlay: (controller) => controller.repeat());
  }
}
