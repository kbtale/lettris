class ScoringSystem {
  static const Map<String, int> letterPoints = {
    // Common letters
    'A': 10, 'E': 10, 'I': 10, 'O': 10, 'U': 10,
    'N': 10, 'R': 10, 'T': 10, 'L': 10, 'S': 10,
    // Medium letters
    'D': 20, 'G': 20, 'B': 20, 'C': 20, 'M': 20, 'P': 20,
    // Hard letters
    'F': 30, 'H': 30, 'V': 30, 'W': 30, 'Y': 30,
    // Rare letters
    'K': 50, 'J': 50, 'X': 50, 'Q': 50, 'Z': 50,
  };

  static int getBaseWordPoints(int length) {
    if (length < 4) return 0;
    switch (length) {
      case 4: return 200;
      case 5: return 400;
      case 6: return 800;
      case 7: return 1600;
      default: return 2000 + (400 * (length - 8));
    }
  }

  static int getLetterPoints(String word) {
    return word.split('').fold(0, (sum, letter) => 
      sum + (letterPoints[letter.toUpperCase()] ?? 0));
  }

  static int calculateWordScore({
    required String word,
    required bool isVertical,
    required bool isPerfectLine,
  }) {
    if (word.length < 4) return 0;
    
    // Calculate base points
    int basePoints = getBaseWordPoints(word.length);
    int letterBonusPoints = getLetterPoints(word);
    int totalPoints = basePoints + letterBonusPoints;

    // Apply vertical bonus if applicable
    if (isVertical) {
      totalPoints = (totalPoints * 1.5).round();
    }

    // Apply perfect line bonus if applicable
    if (isPerfectLine) {
      totalPoints = (totalPoints * 3) + 1000;
    }

    return totalPoints;
  }

  static int calculateCombinationScore(List<WordScore> words) {
    // Sum up all individual word scores
    int totalPoints = words.fold(0, (sum, word) => sum + word.points);
    
    // Apply combination multiplier
    switch (words.length) {
      case 2: return totalPoints * 2;
      case 3: return totalPoints * 3;
      case 4: return totalPoints * 5;
      default: return words.length > 4 ? totalPoints * 5 : totalPoints;
    }
  }

  static int calculateLinesClearedScore(int lines) {
    switch (lines) {
      case 1: return 100;
      case 2: return 300;
      case 3: return 500;
      case 4: return 800;
      default: return 0;
    }
  }
}

class WordScore {
  final String word;
  final bool isVertical;
  final bool isPerfectLine;
  final int points;

  WordScore({
    required this.word,
    required this.isVertical,
    required this.isPerfectLine,
  }) : points = ScoringSystem.calculateWordScore(
         word: word,
         isVertical: isVertical,
         isPerfectLine: isPerfectLine,
       );
}
