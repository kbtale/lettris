// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreImpl _$$ScoreImplFromJson(Map<String, dynamic> json) => _$ScoreImpl(
      currentScore: (json['currentScore'] as num?)?.toInt() ?? 0,
      highScore: (json['highScore'] as num?)?.toInt() ?? 0,
      backToBackCount: (json['backToBackCount'] as num?)?.toInt() ?? 0,
      lastWasBackToBack: json['lastWasBackToBack'] as bool? ?? false,
      multiplier: (json['multiplier'] as num?)?.toDouble() ?? 1.0,
    );

Map<String, dynamic> _$$ScoreImplToJson(_$ScoreImpl instance) =>
    <String, dynamic>{
      'currentScore': instance.currentScore,
      'highScore': instance.highScore,
      'backToBackCount': instance.backToBackCount,
      'lastWasBackToBack': instance.lastWasBackToBack,
      'multiplier': instance.multiplier,
    };
