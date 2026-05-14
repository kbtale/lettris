import 'board.dart';

class ClearedLinesResult {
  final List<List<CellData?>> newGrid;
  final int score;
  final List<String> words;
  final int linesCleared;
  final List<Position> clearedPositions;

  ClearedLinesResult(
    this.newGrid,
    this.score,
    this.words,
    this.linesCleared, [
    this.clearedPositions = const [],
  ]);
}

class CompleteLinesResult {
  final List<List<CellData?>> grid;
  final int linesCleared;
  final List<int> clearedLines;

  CompleteLinesResult(
    this.grid,
    this.linesCleared, [
    this.clearedLines = const [],
  ]);
}

class Position {
  final int row;
  final int col;

  Position(this.row, this.col);
}

class WordMatch {
  final List<Position> positions;
  final String word;
  final bool isHorizontal;

  WordMatch({
    required this.positions,
    required this.word,
    required this.isHorizontal,
  });
}
