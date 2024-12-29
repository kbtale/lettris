import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/game_settings.dart';

final difficultySettingsProvider =
    StateNotifierProvider<DifficultySettingsController, GameSettings>((ref) {
  return DifficultySettingsController();
});

class DifficultySettingsController extends StateNotifier<GameSettings> {
  DifficultySettingsController() : super(const GameSettings()) {
    _loadSettings();
  }

  static const _settingsKey = 'difficulty_settings';

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = prefs.getString(_settingsKey);
    if (settingsJson != null) {
      try {
        final settings = GameSettings.fromJson(
          Map<String, dynamic>.from(
            const GameSettings().toJson(),
          ),
        );
        state = settings;
      } catch (e) {
        // If loading fails, keep default settings
      }
    }
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, state.toJson().toString());
  }

  void setMinWordLength(int length) {
    state = state.copyWith(minWordLength: length);
    _saveSettings();
  }

  void toggleHorizontalWords(bool allow) {
    state = state.copyWith(allowHorizontalWords: allow);
    _saveSettings();
  }

  void toggleVerticalWords(bool allow) {
    state = state.copyWith(allowVerticalWords: allow);
    _saveSettings();
  }

  void toggleLongWordsOnly(bool enable) {
    state = state.copyWith(
      onlyLongWords: enable,
      longWordMinLength: enable ? 6 : 0,
    );
    _saveSettings();
  }

  void setLongWordMinLength(int length) {
    state = state.copyWith(longWordMinLength: length);
    _saveSettings();
  }
}
