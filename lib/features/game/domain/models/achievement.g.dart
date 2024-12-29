// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$AchievementTypeEnumMap, json['type']),
      threshold: (json['threshold'] as num).toInt(),
      unlocked: json['unlocked'] as bool? ?? false,
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$AchievementTypeEnumMap[instance.type]!,
      'threshold': instance.threshold,
      'unlocked': instance.unlocked,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
    };

const _$AchievementTypeEnumMap = {
  AchievementType.wordsFormed: 'wordsFormed',
  AchievementType.perfectLines: 'perfectLines',
  AchievementType.longWords: 'longWords',
  AchievementType.specialWords: 'specialWords',
  AchievementType.dailyStreak: 'dailyStreak',
  AchievementType.totalScore: 'totalScore',
};

_$AchievementProgressImpl _$$AchievementProgressImplFromJson(
        Map<String, dynamic> json) =>
    _$AchievementProgressImpl(
      progress: (json['progress'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                $enumDecode(_$AchievementTypeEnumMap, k), (e as num).toInt()),
          ) ??
          const {},
      achievements: (json['achievements'] as List<dynamic>?)
              ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AchievementProgressImplToJson(
        _$AchievementProgressImpl instance) =>
    <String, dynamic>{
      'progress': instance.progress
          .map((k, e) => MapEntry(_$AchievementTypeEnumMap[k]!, e)),
      'achievements': instance.achievements,
    };
