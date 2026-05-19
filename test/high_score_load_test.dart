import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettris/features/game/presentation/controllers/game_controller.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('GameController loads high score from SharedPreferences', () async {
    SharedPreferences.setMockInitialValues({'high_score': 123});

    final container = ProviderContainer();
    addTearDown(container.dispose);

    // Allow async init in controller to complete
    await Future.delayed(const Duration(milliseconds: 20));

    final state = container.read(gameControllerProvider);
    expect(state.highScore, 123);
  });
}
