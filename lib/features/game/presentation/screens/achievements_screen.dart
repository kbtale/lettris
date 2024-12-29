import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/achievement_controller.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementProgress = ref.watch(achievementControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Achievements'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: achievementProgress.achievements.length,
          itemBuilder: (context, index) {
            final achievement = achievementProgress.achievements[index];
            final currentProgress = achievementProgress.progress[achievement.type] ?? 0;
            final progressPercentage = currentProgress / achievement.threshold;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                color: achievement.unlocked ? Colors.green.shade900 : Colors.grey.shade900,
                child: ListTile(
                  leading: Icon(
                    achievement.unlocked ? Icons.emoji_events : Icons.lock_outline,
                    color: achievement.unlocked ? Colors.amber : Colors.grey,
                  ),
                  title: Text(
                    achievement.title,
                    style: TextStyle(
                      color: achievement.unlocked ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        achievement.description,
                        style: TextStyle(
                          color: achievement.unlocked ? Colors.white70 : Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: progressPercentage.clamp(0.0, 1.0),
                        backgroundColor: Colors.grey.shade800,
                        valueColor: AlwaysStoppedAnimation(
                          achievement.unlocked ? Colors.green : Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '$currentProgress / ${achievement.threshold}',
                        style: TextStyle(
                          color: achievement.unlocked ? Colors.white70 : Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  trailing: achievement.unlocked && achievement.unlockedAt != null
                      ? Tooltip(
                          message: 'Unlocked on ${_formatDate(achievement.unlockedAt!)}',
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        )
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
