import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/game_settings.dart';

final settingsControllerProvider =
    StateNotifierProvider<SettingsController, GameSettings>((ref) {
  return SettingsController();
});

class SettingsController extends StateNotifier<GameSettings> {
  SettingsController() : super(const GameSettings()) {
    _loadSettings();
  }

  static const _settingsKey = 'game_settings';
  late final SharedPreferences _prefs;

  Future<void> _loadSettings() async {
    _prefs = await SharedPreferences.getInstance();
    final settingsJson = _prefs.getString(_settingsKey);
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
    await _prefs.setString(_settingsKey, state.toJson().toString());
  }

  void toggleAnimations() {
    state = state.copyWith(showAnimations: !state.showAnimations);
    _saveSettings();
  }

  void setRotationDirection(RotationDirection direction) {
    state = state.copyWith(rotationDirection: direction);
    _saveSettings();
  }

  void toggleTSpins() {
    state = state.copyWith(enableTSpins: !state.enableTSpins);
    _saveSettings();
  }

  void toggleGhostPiece() {
    state = state.copyWith(showGhostPiece: !state.showGhostPiece);
    _saveSettings();
  }

  void setTouchSensitivity(double sensitivity) {
    state = state.copyWith(touchSensitivity: sensitivity);
    _saveSettings();
  }

  void updateControl(String action, String control) {
    final updatedControls = Map<String, String>.from(state.customControls);
    updatedControls[action] = control;
    state = state.copyWith(customControls: updatedControls);
    _saveSettings();
  }
}
