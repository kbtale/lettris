import 'package:flutter_test/flutter_test.dart';
import 'package:lettris/features/game/domain/models/scoring_system.dart';

void main() {
  group('ScoringSystem Tests', () {
    test('getBaseWordPoints', () {
      expect(ScoringSystem.getBaseWordPoints(3), 0);
      expect(ScoringSystem.getBaseWordPoints(4), 200);
      expect(ScoringSystem.getBaseWordPoints(5), 400);
      expect(ScoringSystem.getBaseWordPoints(6), 800);
      expect(ScoringSystem.getBaseWordPoints(7), 1600);
      expect(ScoringSystem.getBaseWordPoints(8), 2000);
      expect(ScoringSystem.getBaseWordPoints(9), 2400);
    });

    test('getLetterPoints', () {
      expect(ScoringSystem.getLetterPoints('AEIOU'), 50);
      expect(ScoringSystem.getLetterPoints('DGBCMP'), 120);
      expect(ScoringSystem.getLetterPoints('FHVWY'), 150);
      expect(ScoringSystem.getLetterPoints('KJXQZ'), 250);
      expect(ScoringSystem.getLetterPoints(''), 0);
    });

    test('calculateWordScore basic', () {
      expect(
        ScoringSystem.calculateWordScore(
          word: 'CAT',
          isVertical: false,
          isPerfectLine: false,
        ),
        0,
      );

      final word1 = 'TEST';
      final base1 = ScoringSystem.getBaseWordPoints(4);
      final letter1 = ScoringSystem.getLetterPoints(word1);
      expect(
        ScoringSystem.calculateWordScore(
          word: word1,
          isVertical: false,
          isPerfectLine: false,
        ),
        base1 + letter1,
      );
    });

    test('calculateWordScore vertical bonus', () {
      final word = 'TEST';
      final base = ScoringSystem.getBaseWordPoints(4);
      final letter = ScoringSystem.getLetterPoints(word);
      final expected = ((base + letter) * 1.5).round();
      expect(
        ScoringSystem.calculateWordScore(
          word: word,
          isVertical: true,
          isPerfectLine: false,
        ),
        expected,
      );
    });

    test('calculateWordScore perfect line bonus', () {
      final word = 'TEST';
      final base = ScoringSystem.getBaseWordPoints(4);
      final letter = ScoringSystem.getLetterPoints(word);
      final expected = (base + letter) * 3 + 1000;
      expect(
        ScoringSystem.calculateWordScore(
          word: word,
          isVertical: false,
          isPerfectLine: true,
        ),
        expected,
      );
    });

    test('calculateCombinationScore', () {
      final score1 = WordScore(word: 'TEST', isVertical: false, isPerfectLine: false);
      final score2 = WordScore(word: 'HEllo', isVertical: false, isPerfectLine: false);
      
      final sum = score1.points + score2.points;
      expect(ScoringSystem.calculateCombinationScore([score1]), score1.points);
      expect(ScoringSystem.calculateCombinationScore([score1, score2]), sum * 2);
    });
  });
}
