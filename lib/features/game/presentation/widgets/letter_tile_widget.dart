import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/models/letter_tile.dart';

class LetterTileWidget extends StatelessWidget {
  final LetterTile tile;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isAnimating;

  const LetterTileWidget({
    super.key,
    required this.tile,
    required this.isSelected,
    required this.onTap,
    this.isAnimating = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade700 : Colors.blue.shade900,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(-2, -2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            tile.letter,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      )
          .animate(target: isSelected ? 1 : 0)
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(0.95, 0.95),
            duration: const Duration(milliseconds: 150),
          )
          .animate(target: isAnimating ? 1 : 0)
          .moveY(
            begin: -100,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
          ),
    );
  }
}
