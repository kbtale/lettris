import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings.freezed.dart';
part 'game_settings.g.dart';

enum RotationDirection {
  clockwise,
  counterClockwise,
  both
}

@freezed
class GameSettings with _$GameSettings {
  const factory GameSettings({
    @Default(true) bool showAnimations,
    @Default(RotationDirection.clockwise) RotationDirection rotationDirection,
    @Default(true) bool enableTSpins,
    @Default(true) bool showGhostPiece,
    @Default(0.8) double touchSensitivity,
    @Default({}) Map<String, String> customControls,
  }) = _GameSettings;

  factory GameSettings.fromJson(Map<String, dynamic> json) =>
      _$GameSettingsFromJson(json);
}
