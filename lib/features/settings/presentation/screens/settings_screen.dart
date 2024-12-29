import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/glassmorphic_container.dart';
import '../../../../core/styles/neumorphic_button.dart';
import '../../domain/models/game_settings.dart';
import '../controllers/settings_controller.dart';
import '../widgets/settings_switch.dart';
import '../widgets/settings_slider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final controller = ref.read(settingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: GlassmorphicContainer(
          blur: 15,
          opacity: 0.1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Game Settings',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                SettingsSwitch(
                  title: 'Show Animations',
                  value: settings.showAnimations,
                  onChanged: (_) => controller.toggleAnimations(),
                ),
                const SizedBox(height: 16),
                SettingsSwitch(
                  title: 'Enable T-Spins',
                  value: settings.enableTSpins,
                  onChanged: (_) => controller.toggleTSpins(),
                ),
                const SizedBox(height: 16),
                SettingsSwitch(
                  title: 'Show Ghost Piece',
                  value: settings.showGhostPiece,
                  onChanged: (_) => controller.toggleGhostPiece(),
                ),
                const SizedBox(height: 24),
                Text(
                  'Rotation Direction',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: RotationDirection.values.map((direction) {
                    return NeumorphicButton(
                      width: 120,
                      onPressed: () => controller.setRotationDirection(direction),
                      child: Text(
                        direction.name,
                        style: TextStyle(
                          color: settings.rotationDirection == direction
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
                Text(
                  'Touch Sensitivity',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                SettingsSlider(
                  value: settings.touchSensitivity,
                  onChanged: controller.setTouchSensitivity,
                ),
                const SizedBox(height: 24),
                Text(
                  'Controls',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16),
                // TODO: Implement control customization UI
              ],
            ),
          ),
        ),
      ),
    );
  }
}
