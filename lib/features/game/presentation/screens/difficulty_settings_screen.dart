import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/game_settings.dart';

class DifficultySettingsScreen extends ConsumerWidget {
  const DifficultySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Difficulty Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Word Length Settings
            Text(
              'Minimum Word Length',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 8),
            Slider(
              value: 5,
              min: 5,
              max: 7,
              divisions: 2,
              label: '5 letters',
              onChanged: (value) {
                // TODO: Update settings
              },
            ),

            const SizedBox(height: 24),

            // Word Direction Settings
            Text(
              'Word Direction',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text(
                'Allow Horizontal Words',
                style: TextStyle(color: Colors.white),
              ),
              value: true,
              onChanged: (value) {
                // TODO: Update settings
              },
            ),
            SwitchListTile(
              title: const Text(
                'Allow Vertical Words',
                style: TextStyle(color: Colors.white),
              ),
              value: true,
              onChanged: (value) {
                // TODO: Update settings
              },
            ),

            const SizedBox(height: 24),

            // Long Words Only Mode
            Text(
              'Long Words Mode',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text(
                'Only Long Words',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                'Only allow words with 6 letters or more',
                style: TextStyle(color: Colors.grey),
              ),
              value: false,
              onChanged: (value) {
                // TODO: Update settings
              },
            ),
            
            const Spacer(),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Apply Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
