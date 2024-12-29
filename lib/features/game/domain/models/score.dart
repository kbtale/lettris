import 'package:freezed_annotation/freezed_annotation.dart';

part 'score.freezed.dart';
part 'score.g.dart';

@freezed
class Score with _$Score {
  const factory Score({
    @Default(0) int currentScore,
    @Default(0) int highScore,
    @Default(0) int backToBackCount,
    @Default(false) bool lastWasBackToBack,
    @Default(1.0) double multiplier,
  }) = _Score;

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
}
