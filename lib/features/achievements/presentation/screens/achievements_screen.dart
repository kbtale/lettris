import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/glassmorphic_container.dart';
import '../../../game/presentation/controllers/achievement_controller.dart';

class AchievementsScreen extends ConsumerWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementProgress = ref.watch(achievementControllerProvider);

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
              // Header with back button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Achievements',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Achievements list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: achievementProgress.achievements.length,
                  itemBuilder: (context, index) {
                    final achievement = achievementProgress.achievements[index];
                    final currentProgress = achievementProgress.progress[achievement.type] ?? 0;
                    final progressPercentage = currentProgress / achievement.threshold;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GlassmorphicContainer(
                        blur: 10,
                        opacity: achievement.unlocked ? 0.1 : 0.05,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: (achievement.unlocked ? Colors.green : Colors.blue).withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        child: ListTile(
                          leading: Icon(
                            achievement.unlocked ? Icons.emoji_events : Icons.lock_outline,
                            color: achievement.unlocked ? Colors.amber : Colors.grey,
                            size: 32,
                          ),
                          title: Text(
                            achievement.title,
                            style: TextStyle(
                              color: achievement.unlocked ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                achievement.description,
                                style: TextStyle(
                                  color: achievement.unlocked ? Colors.white70 : Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: progressPercentage.clamp(0.0, 1.0),
                                  backgroundColor: Colors.black26,
                                  valueColor: AlwaysStoppedAnimation(
                                    achievement.unlocked ? Colors.green : Colors.blue,
                                  ),
                                  minHeight: 8,
                                ),
                              ),
                              const SizedBox(height: 4),
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
                                    size: 28,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
