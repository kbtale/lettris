import 'board.dart';

class ClearedLinesResult {
  final List<List<CellData?>> newGrid;
  final int score;
  final List<String> words;
  final int linesCleared;

  ClearedLinesResult(this.newGrid, this.score, this.words, this.linesCleared);
}

class CompleteLinesResult {
  final List<List<CellData?>> grid;
  final int linesCleared;

  CompleteLinesResult(this.grid, this.linesCleared);
}
