import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/animated_background.dart';
import '../../../../core/styles/glassmorphic_container.dart';
import '../../../../core/styles/neumorphic_button.dart';
import '../../../../core/styles/neumorphic_styles.dart';
import '../../../achievements/presentation/screens/achievements_screen.dart';
import '../../../game/presentation/screens/game_screen.dart';
import '../../../game/presentation/screens/word_sets_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../tutorial/presentation/screens/tutorial_screen.dart';
import '../controllers/main_menu_controller.dart';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainMenuControllerProvider);
    final controller = ref.read(mainMenuControllerProvider.notifier);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              const AnimatedBackground(),
              Center(
                child: GlassmorphicContainer(
                  blur: 15,
                  opacity: 0.1,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'LETTRIS',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 60),
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GameScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Start Game',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TutorialScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Tutorial',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Settings',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AchievementsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Achievements',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WordSetsScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Word Sets',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      NeumorphicButton(
                        onPressed: () {
                          controller.setLanguage(
                            state.currentLanguage == 'en' ? 'es' : 'en',
                          );
                        },
                        child: Text(
                          state.currentLanguage == 'en' ? 'Español' : 'English',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
