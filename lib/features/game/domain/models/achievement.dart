import 'package:freezed_annotation/freezed_annotation.dart';

part 'achievement.freezed.dart';
part 'achievement.g.dart';

enum AchievementType {
  wordsFormed,
  perfectLines,
  longWords,
  specialWords,
  dailyStreak,
  totalScore,
}

@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String title,
    required String description,
    required AchievementType type,
    required int threshold,
    @Default(false) bool unlocked,
    DateTime? unlockedAt,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) => _$AchievementFromJson(json);
}

@freezed
class AchievementProgress with _$AchievementProgress {
  const factory AchievementProgress({
    @Default({}) Map<AchievementType, int> progress,
    @Default([]) List<Achievement> achievements,
  }) = _AchievementProgress;

  factory AchievementProgress.fromJson(Map<String, dynamic> json) => _$AchievementProgressFromJson(json);

  factory AchievementProgress.initial() {
    return AchievementProgress(
      progress: {
        for (var type in AchievementType.values) type: 0
      },
      achievements: [
        // Word Formation Achievements
        Achievement(
          id: 'words_beginner',
          title: 'Word Beginner',
          description: 'Form 10 words',
          type: AchievementType.wordsFormed,
          threshold: 10,
        ),
        Achievement(
          id: 'words_intermediate',
          title: 'Word Enthusiast',
          description: 'Form 50 words',
          type: AchievementType.wordsFormed,
          threshold: 50,
        ),
        Achievement(
          id: 'words_expert',
          title: 'Word Master',
          description: 'Form 100 words',
          type: AchievementType.wordsFormed,
          threshold: 100,
        ),

        // Perfect Lines Achievements
        Achievement(
          id: 'perfect_lines_beginner',
          title: 'Line Perfectionist',
          description: 'Clear 5 perfect lines',
          type: AchievementType.perfectLines,
          threshold: 5,
        ),
        Achievement(
          id: 'perfect_lines_intermediate',
          title: 'Perfect Line Expert',
          description: 'Clear 25 perfect lines',
          type: AchievementType.perfectLines,
          threshold: 25,
        ),
        Achievement(
          id: 'perfect_lines_expert',
          title: 'Perfect Line Master',
          description: 'Clear 50 perfect lines',
          type: AchievementType.perfectLines,
          threshold: 50,
        ),

        // Long Words Achievements
        Achievement(
          id: 'long_words_beginner',
          title: 'Wordsmith',
          description: 'Form a 6-letter word',
          type: AchievementType.longWords,
          threshold: 6,
        ),
        Achievement(
          id: 'long_words_intermediate',
          title: 'Word Architect',
          description: 'Form a 7-letter word',
          type: AchievementType.longWords,
          threshold: 7,
        ),
        Achievement(
          id: 'long_words_expert',
          title: 'Word Legend',
          description: 'Form an 8-letter word',
          type: AchievementType.longWords,
          threshold: 8,
        ),

        // Special Words Achievements
        Achievement(
          id: 'special_words_beginner',
          title: 'Word Hunter',
          description: 'Form 3 words with Q, J, X, or Z',
          type: AchievementType.specialWords,
          threshold: 3,
        ),
        Achievement(
          id: 'special_words_intermediate',
          title: 'Rare Word Collector',
          description: 'Form 10 words with Q, J, X, or Z',
          type: AchievementType.specialWords,
          threshold: 10,
        ),
        Achievement(
          id: 'special_words_expert',
          title: 'Rare Word Master',
          description: 'Form 20 words with Q, J, X, or Z',
          type: AchievementType.specialWords,
          threshold: 20,
        ),

        // Daily Streak Achievements
        Achievement(
          id: 'daily_streak_beginner',
          title: 'Daily Player',
          description: 'Play for 3 consecutive days',
          type: AchievementType.dailyStreak,
          threshold: 3,
        ),
        Achievement(
          id: 'daily_streak_intermediate',
          title: 'Dedicated Player',
          description: 'Play for 7 consecutive days',
          type: AchievementType.dailyStreak,
          threshold: 7,
        ),
        Achievement(
          id: 'daily_streak_expert',
          title: 'Lettris Veteran',
          description: 'Play for 30 consecutive days',
          type: AchievementType.dailyStreak,
          threshold: 30,
        ),

        // Total Score Achievements
        Achievement(
          id: 'score_beginner',
          title: 'Score Hunter',
          description: 'Reach a score of 10,000',
          type: AchievementType.totalScore,
          threshold: 10000,
        ),
        Achievement(
          id: 'score_intermediate',
          title: 'Score Master',
          description: 'Reach a score of 50,000',
          type: AchievementType.totalScore,
          threshold: 50000,
        ),
        Achievement(
          id: 'score_expert',
          title: 'Score Legend',
          description: 'Reach a score of 100,000',
          type: AchievementType.totalScore,
          threshold: 100000,
        ),
      ],
    );
  }
}
