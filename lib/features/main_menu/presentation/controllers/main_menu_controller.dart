import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_menu_controller.freezed.dart';

@freezed
class MainMenuState with _$MainMenuState {
  const factory MainMenuState({
    @Default(false) bool isLoading,
    @Default('en') String currentLanguage,
  }) = _MainMenuState;
}

final mainMenuControllerProvider =
    StateNotifierProvider<MainMenuController, MainMenuState>((ref) {
  return MainMenuController();
});

class MainMenuController extends StateNotifier<MainMenuState> {
  MainMenuController() : super(const MainMenuState());

  void setLanguage(String language) {
    state = state.copyWith(currentLanguage: language);
  }

  Future<void> startGame() async {
    state = state.copyWith(isLoading: true);
    // TODO: Implement game start logic
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false);
  }
}
