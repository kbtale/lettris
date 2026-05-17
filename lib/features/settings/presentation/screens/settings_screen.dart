import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Container(
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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Settings',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
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
                            'Controls Customization',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          ..._buildControlsList(context, ref, settings, controller),
                          const SizedBox(height: 24),
                          Center(
                            child: NeumorphicButton(
                              width: 200,
                              onPressed: () => controller.resetControls(),
                              child: const Text(
                                'Reset to Defaults',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildControlsList(
    BuildContext context,
    WidgetRef ref,
    GameSettings settings,
    SettingsController controller,
  ) {
    final actions = {
      'move_left': 'Move Left',
      'move_right': 'Move Right',
      'rotate': 'Rotate',
      'soft_drop': 'Soft Drop',
      'hard_drop': 'Hard Drop',
      'hold': 'Hold Piece',
    };

    return actions.entries.map((entry) {
      final action = entry.key;
      final name = entry.value;
      final currentKey = settings.customControls[action] ?? _getDefaultKeyLabel(action);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            NeumorphicButton(
              width: 150,
              onPressed: () => _showRebindDialog(context, controller, action, name),
              child: Text(
                currentKey,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  String _getDefaultKeyLabel(String action) {
    switch (action) {
      case 'move_left':
        return 'Arrow Left';
      case 'move_right':
        return 'Arrow Right';
      case 'rotate':
        return 'Arrow Up';
      case 'soft_drop':
        return 'Arrow Down';
      case 'hard_drop':
        return 'Space';
      case 'hold':
        return 'C';
      default:
        return 'Unbound';
    }
  }

  void _showRebindDialog(
    BuildContext context,
    SettingsController controller,
    String action,
    String actionName,
  ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent) {
              final label = event.logicalKey.keyLabel;
              controller.updateControl(action, label);
              Navigator.pop(context);
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: AlertDialog(
            backgroundColor: const Color(0xFF162033),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text(
              'Rebind $actionName',
              style: const TextStyle(color: Colors.white),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.keyboard,
                  size: 48,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Press any key on your keyboard...',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                NeumorphicButton(
                  width: 100,
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
