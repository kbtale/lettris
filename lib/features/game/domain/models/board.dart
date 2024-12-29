import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'piece.dart';
import 'word_checker.dart';
import 'scoring_system.dart';
import 'game_results.dart';

part 'board.freezed.dart';
part 'board.g.dart';

Color? _colorFromJson(int? value) => value == null ? null : Color(value);
int? _colorToJson(Color? color) => color?.value;

@freezed
class CellData with _$CellData {
  const factory CellData({
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color? color,
    String? letter,
  }) = _CellData;

  factory CellData.fromJson(Map<String, dynamic> json) => _$CellDataFromJson(json);
}

@freezed
class Board with _$Board {
  const Board._();

  const factory Board({
    required List<List<CellData?>> grid,
    Piece? currentPiece,
    Piece? heldPiece,
    @Default(false) bool isGameOver,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.empty({required int rows, required int cols}) {
    return Board(
      grid: List.generate(
        rows,
        (_) => List.generate(cols, (_) => null),
      ),
    );
  }

  Board lockPiece() {
    if (currentPiece == null) return this;

    var newGrid = List<List<CellData?>>.from(
      grid.map((row) => List<CellData?>.from(row)),
    );

    // Add the current piece to the grid
    for (var row = 0; row < currentPiece!.shape.length; row++) {
      for (var col = 0; col < currentPiece!.shape[row].length; col++) {
        if (currentPiece!.shape[row][col]) {
          final gridY = currentPiece!.y + row;
          final gridX = currentPiece!.x + col;
          if (gridY >= 0 && gridY < rows && gridX >= 0 && gridX < cols) {
            newGrid[gridY][gridX] = CellData(
              color: currentPiece!.color,
              letter: currentPiece!.letters[row][col],
            );
          }
        }
      }
    }

    return copyWith(
      grid: newGrid,
      currentPiece: null,
    );
  }

  ClearedLinesResult clearLinesAndCalculateScore() {
    var newGrid = List<List<CellData?>>.generate(
      rows,
      (i) => List<CellData?>.from(grid[i], growable: false),
      growable: false,
    );

    // Find words in the grid
    var wordMatches = _findWords(newGrid);
    
    if (wordMatches.isNotEmpty) {
      // Calculate word scores
      var wordScores = <WordScore>[];
      
      for (var match in wordMatches) {
        // Check if it's a perfect line (horizontal word that fills a line)
        bool isPerfectLine = match.isHorizontal && 
          match.word.length == cols &&
          match.positions.every((pos) => 
            newGrid[pos.row].every((cell) => cell?.letter != null));

        wordScores.add(WordScore(
          word: match.word,
          isVertical: !match.isHorizontal,
          isPerfectLine: isPerfectLine,
        ));
      }

      // Calculate total score with combinations
      int totalScore = ScoringSystem.calculateCombinationScore(wordScores);

      // Clear cells involved in words
      for (var match in wordMatches) {
        for (var pos in match.positions) {
          newGrid[pos.row][pos.col] = null;
        }
      }

      // Apply gravity
      newGrid = _applyGravity(newGrid);

      return ClearedLinesResult(
        newGrid,
        totalScore,
        wordMatches.map((m) => m.word).toList(),
        0, // No lines cleared, only words
      );
    }

    // If no words found, check for complete lines
    var completeLinesResult = _clearCompleteLines(newGrid);
    return ClearedLinesResult(
      completeLinesResult.grid,
      completeLinesResult.linesCleared > 0 
        ? ScoringSystem.calculateLinesClearedScore(completeLinesResult.linesCleared)
        : 0,
      [],
      completeLinesResult.linesCleared,
    );
  }

  CompleteLinesResult _clearCompleteLines(List<List<CellData?>> grid) {
    var clearedLines = <int>[];
    
    // Find lines to clear (from bottom to top)
    for (var row = rows - 1; row >= 0; row--) {
      if (grid[row].every((cell) => cell != null)) {
        clearedLines.add(row);
      }
    }
    
    // If no lines to clear, return the same grid
    if (clearedLines.isEmpty) {
      return CompleteLinesResult(grid, 0);
    }
    
    // Create the new grid with cleared lines
    var resultGrid = List<List<CellData?>>.generate(
      rows,
      (i) => List<CellData?>.filled(cols, null),
      growable: false,
    );
    
    // Copy non-cleared lines to new grid (from bottom to top)
    var sourceRow = rows - 1;
    var targetRow = rows - 1;
    
    while (sourceRow >= 0 && targetRow >= 0) {
      if (clearedLines.contains(sourceRow)) {
        sourceRow--; // Skip this row as it was cleared
      } else {
        // Copy the row
        resultGrid[targetRow] = List<CellData?>.from(grid[sourceRow]);
        sourceRow--;
        targetRow--;
      }
    }
    
    return CompleteLinesResult(resultGrid, clearedLines.length);
  }

  List<WordMatch> _findWords(List<List<CellData?>> grid) {
    var matches = <WordMatch>[];
    
    // Check horizontal words
    for (var row = 0; row < rows; row++) {
      var word = '';
      var positions = <Position>[];
      
      for (var col = 0; col < cols; col++) {
        if (grid[row][col]?.letter != null) {
          word += grid[row][col]!.letter!;
          positions.add(Position(row, col));
        } else if (word.isNotEmpty) {
          if (WordChecker.isValidWord(word)) {
            matches.add(WordMatch(
              positions: List.from(positions),
              word: word,
              isHorizontal: true,
            ));
          }
          word = '';
          positions.clear();
        }
      }
      
      // Check word at end of row
      if (word.isNotEmpty && WordChecker.isValidWord(word)) {
        matches.add(WordMatch(
          positions: List.from(positions),
          word: word,
          isHorizontal: true,
        ));
      }
    }
    
    // Check vertical words
    for (var col = 0; col < cols; col++) {
      var word = '';
      var positions = <Position>[];
      
      for (var row = 0; row < rows; row++) {
        if (grid[row][col]?.letter != null) {
          word += grid[row][col]!.letter!;
          positions.add(Position(row, col));
        } else if (word.isNotEmpty) {
          if (WordChecker.isValidWord(word)) {
            matches.add(WordMatch(
              positions: List.from(positions),
              word: word,
              isHorizontal: false,
            ));
          }
          word = '';
          positions.clear();
        }
      }
      
      // Check word at end of column
      if (word.isNotEmpty && WordChecker.isValidWord(word)) {
        matches.add(WordMatch(
          positions: List.from(positions),
          word: word,
          isHorizontal: false,
        ));
      }
    }
    
    return matches;
  }

  List<List<CellData?>> _applyGravity(List<List<CellData?>> grid) {
    var newGrid = List<List<CellData?>>.generate(
      rows,
      (i) => List<CellData?>.filled(cols, null),
      growable: false,
    );

    // For each column
    for (var col = 0; col < cols; col++) {
      var targetRow = rows - 1;
      
      // Start from bottom, move cells down
      for (var row = rows - 1; row >= 0; row--) {
        if (grid[row][col] != null) {
          newGrid[targetRow][col] = grid[row][col];
          targetRow--;
        }
      }
    }

    return newGrid;
  }

  Piece? getShadowPiece() {
    if (currentPiece == null) return null;

    var shadowPiece = currentPiece!;
    var testY = shadowPiece.y;

    // Move the piece down until it collides
    while (isValidMove(shadowPiece.x, testY + 1, shadowPiece.shape)) {
      testY++;
    }

    return shadowPiece.copyWith(y: testY);
  }

  bool isValidMove(int x, int y, List<List<bool>> shape) {
    for (var row = 0; row < shape.length; row++) {
      for (var col = 0; col < shape[row].length; col++) {
        if (shape[row][col]) {
          final boardRow = y + row;
          final boardCol = x + col;

          if (boardRow < 0 || boardRow >= rows || boardCol < 0 || boardCol >= cols) {
            return false;
          }

          if (grid[boardRow][boardCol] != null) {
            return false;
          }
        }
      }
    }
    return true;
  }

  int get rows => grid.length;
  int get cols => grid[0].length;
}
