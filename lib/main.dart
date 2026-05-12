import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'features/main_menu/presentation/screens/main_menu_screen.dart';
import 'features/game/domain/services/dictionary_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(dictionaryServiceProvider).initialize();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const LettrisApp(),
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
