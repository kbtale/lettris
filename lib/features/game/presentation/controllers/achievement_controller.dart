import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/achievement.dart';

final achievementControllerProvider = StateNotifierProvider<AchievementController, AchievementProgress>((ref) {
  return AchievementController();
});

class AchievementController extends StateNotifier<AchievementProgress> {
  static const _achievementsKey = 'achievements';
  static const _progressKey = 'achievement_progress';
  static const _lastPlayedKey = 'last_played_date';
  static const _streakKey = 'current_streak';
  static const _streakStartKey = 'streak_start_date';
  
  AchievementController() : super(AchievementProgress.initial()) {
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Load achievements
    final achievementsJson = prefs.getString(_achievementsKey);
    if (achievementsJson != null) {
      // Parse achievements and update state
      // TODO: Implement JSON parsing
    }

    // Load progress
    final progressJson = prefs.getString(_progressKey);
    if (progressJson != null) {
      // Parse progress and update state
      // TODO: Implement JSON parsing
    }

    // Check daily streak
    await _updateDailyStreak();
  }

  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    // TODO: Implement JSON serialization
    // await prefs.setString(_achievementsKey, jsonEncode(state.achievements));
    // await prefs.setString(_progressKey, jsonEncode(state.progress));
  }

  Future<void> _updateDailyStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toLocal();
    final lastPlayed = prefs.getString(_lastPlayedKey);
    
    if (lastPlayed != null) {
      final lastPlayedDate = DateTime.parse(lastPlayed).toLocal();
      final difference = today.difference(lastPlayedDate).inDays;

      if (difference == 1) {
        // Consecutive day
        final currentStreak = prefs.getInt(_streakKey) ?? 1;
        await prefs.setInt(_streakKey, currentStreak + 1);
        _updateProgress(AchievementType.dailyStreak, currentStreak + 1);
      } else if (difference > 1) {
        // Streak broken
        await prefs.setInt(_streakKey, 1);
        await prefs.setString(_streakStartKey, today.toIso8601String());
      }
    } else {
      // First time playing
      await prefs.setInt(_streakKey, 1);
      await prefs.setString(_streakStartKey, today.toIso8601String());
    }

    // Update last played date
    await prefs.setString(_lastPlayedKey, today.toIso8601String());
  }

  void _updateProgress(AchievementType type, int value) {
    final newProgress = Map<AchievementType, int>.from(state.progress);
    newProgress[type] = value;

    final updatedAchievements = state.achievements.map((achievement) {
      if (achievement.type == type && 
          !achievement.unlocked && 
          value >= achievement.threshold) {
        return achievement.copyWith(
          unlocked: true,
          unlockedAt: DateTime.now(),
        );
      }
      return achievement;
    }).toList();

    state = state.copyWith(
      progress: newProgress,
      achievements: updatedAchievements,
    );

    _saveProgress();
  }

  void onWordFormed(String word) {
    _updateProgress(AchievementType.wordsFormed, 
      state.progress[AchievementType.wordsFormed]! + 1);

    // Check word length
    _updateProgress(AchievementType.longWords, 
      max(state.progress[AchievementType.longWords] ?? 0, word.length));

    // Check for special letters
    if (word.toUpperCase().contains(RegExp(r'[QJXZ]'))) {
      _updateProgress(AchievementType.specialWords, 
        state.progress[AchievementType.specialWords]! + 1);
    }
  }

  void onPerfectLine() {
    _updateProgress(AchievementType.perfectLines, 
      state.progress[AchievementType.perfectLines]! + 1);
  }

  void onScoreUpdate(int totalScore) {
    _updateProgress(AchievementType.totalScore, totalScore);
  }
}
