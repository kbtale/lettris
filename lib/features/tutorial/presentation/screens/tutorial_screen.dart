import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../../../core/styles/glassmorphic_container.dart';
import '../../../../core/styles/neumorphic_button.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _currentPage = 0;
  final List<TutorialPage> _pages = [
    const TutorialPage(
      title: 'Welcome to Lettris!',
      content: '''
# How to Play Lettris

Lettris combines the excitement of Tetris with word-building mechanics. Here's how to play:

- Blocks contain letters instead of colors
- Form words horizontally or vertically
- Longer words score more points
- Special combinations like T-spins give bonus points
''',
    ),
    const TutorialPage(
      title: 'Controls',
      content: '''
# Game Controls

## Touch Screen
- Swipe left/right to move pieces
- Swipe down to soft drop
- Tap to rotate clockwise
- Swipe up to hold piece

## Keyboard (Desktop/Web)
- Arrow Left / Right: Move Left / Right
- Arrow Up: Rotate clockwise
- Arrow Down: Soft drop
- Spacebar: Hard drop
- Shift / C: Hold piece
''',
    ),
    const TutorialPage(
      title: 'Special Moves',
      content: '''
# Advanced Techniques

## T-Spins
T-spins are special moves that can be performed with T-shaped pieces:
1. Position the T piece near walls or other blocks
2. Rotate it into a tight spot
3. Clear lines for bonus points

## Word Combinations
- Create multiple words at once
- Chain reactions with falling letters
- Use special blocks for multipliers
''',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Tutorial',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: GlassmorphicContainer(
                        blur: 15,
                        opacity: 0.1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _pages[_currentPage].title,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            Expanded(
                              child: Markdown(
                                data: _pages[_currentPage].content,
                                styleSheet: MarkdownStyleSheet(
                                  h1: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(color: Colors.blue),
                                  h2: Theme.of(context).textTheme.titleMedium,
                                  p: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NeumorphicButton(
                            onPressed: _currentPage > 0 
                                ? () => _previousPage()
                                : null,
                            child: const Icon(Icons.arrow_back),
                          ),
                          Text('${_currentPage + 1}/${_pages.length}'),
                          NeumorphicButton(
                            onPressed: _currentPage < _pages.length - 1
                                ? () => _nextPage()
                                : () => Navigator.pop(context),
                            child: Icon(
                              _currentPage < _pages.length - 1
                                  ? Icons.arrow_forward
                                  : Icons.check,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TutorialPage {
  final String title;
  final String content;

  const TutorialPage({
    required this.title,
    required this.content,
  });
}
