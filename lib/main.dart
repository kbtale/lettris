import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/main_menu/presentation/screens/main_menu_screen.dart';
import 'features/game/domain/models/word_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await WordChecker.initialize();
  runApp(
    const ProviderScope(
      child: LettrisApp(),
    ),
  );
}

class LettrisApp extends StatelessWidget {
  const LettrisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '11:32 Lettris',
      theme: AppTheme.darkTheme,
      home: const MainMenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
