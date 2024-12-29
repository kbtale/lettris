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

- Swipe left/right to move pieces
- Swipe down to soft drop
- Tap to rotate clockwise
- Double tap to rotate counter-clockwise
- Swipe up to hold piece
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
      appBar: AppBar(
        title: const Text('Tutorial'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
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
