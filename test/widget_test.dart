import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lettris/features/main_menu/presentation/screens/main_menu_screen.dart';

void main() {
  testWidgets('Main Menu Screen elements check', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: MainMenuScreen(),
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));

    expect(find.text('LETTRIS'), findsOneWidget);
    expect(find.text('Start Game'), findsOneWidget);
    expect(find.text('Tutorial'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);
  });
}
