import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/game_controller.dart';

class GameControls extends ConsumerWidget {
  const GameControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(gameControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Left rotation button
          ElevatedButton(
            onPressed: () => controller.rotate(clockwise: false),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white24,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.rotate_left, color: Colors.white),
          ),
          // 180° rotation button
          ElevatedButton(
            onPressed: () => controller.rotate(rotate180: true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white24,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            child: const Text('180°', style: TextStyle(color: Colors.white)),
          ),
          // Right rotation button
          ElevatedButton(
            onPressed: () => controller.rotate(clockwise: true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white24,
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.rotate_right, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
