import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_settings.freezed.dart';
part 'game_settings.g.dart';

@freezed
class GameSettings with _$GameSettings {
  const factory GameSettings({
    @Default(5) int minWordLength,
    @Default(true) bool allowVerticalWords,
    @Default(true) bool allowHorizontalWords,
    @Default(false) bool onlyLongWords,
    @Default(0) int longWordMinLength, // 6 or 7 for "only X-letter words or more"
  }) = _GameSettings;

  factory GameSettings.fromJson(Map<String, dynamic> json) =>
      _$GameSettingsFromJson(json);
}
