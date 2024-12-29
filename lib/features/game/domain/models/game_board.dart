import 'package:freezed_annotation/freezed_annotation.dart';
import 'letter_tile.dart';
import 'tetromino.dart';

part 'game_board.freezed.dart';
part 'game_board.g.dart';

@freezed
class GameBoard with _$GameBoard {
  const GameBoard._();  // Add private constructor for getters
  
  const factory GameBoard({
    required List<List<LetterTile?>> tiles,
    required Tetromino? currentPiece,
    @Default(false) bool isGameOver,
  }) = _GameBoard;

  factory GameBoard.fromJson(Map<String, dynamic> json) =>
      _$GameBoardFromJson(json);

  static GameBoard empty({required int rows, required int cols}) {
    return GameBoard(
      tiles: List.generate(
        rows,
        (row) => List.generate(cols, (col) => null),
      ),
      currentPiece: Tetromino.generateRandom(),
    );
  }

  int get rows => tiles.length;
  int get cols => tiles[0].length;

  bool isValidMove(int newRow, int newCol, List<List<LetterTile?>> shape) {
    for (var row = 0; row < shape.length; row++) {
      for (var col = 0; col < shape[row].length; col++) {
        if (shape[row][col] == null) continue;

        final boardRow = newRow + row;
        final boardCol = newCol + col;

        // Check bounds
        if (boardRow < 0 || boardRow >= rows) return false;
        if (boardCol < 0 || boardCol >= cols) return false;

        // Check collision with existing pieces
        if (tiles[boardRow][boardCol] != null) return false;
      }
    }
    return true;
  }

  List<String> findWords() {
    final words = <String>[];
    
    // Check horizontal words
    for (var row = 0; row < rows; row++) {
      String word = '';
      for (var col = 0; col < cols; col++) {
        if (tiles[row][col] != null) {
          word += tiles[row][col]!.letter;
        } else if (word.length >= 4) {
          words.add(word);
          word = '';
        } else {
          word = '';
        }
      }
      if (word.length >= 4) words.add(word);
    }

    // Check vertical words
    for (var col = 0; col < cols; col++) {
      String word = '';
      for (var row = 0; row < rows; row++) {
        if (tiles[row][col] != null) {
          word += tiles[row][col]!.letter;
        } else if (word.length >= 4) {
          words.add(word);
          word = '';
        } else {
          word = '';
        }
      }
      if (word.length >= 4) words.add(word);
    }

    return words;
  }

  List<(int, int)> getWordTiles(String word) {
    final positions = <(int, int)>[];
    
    // Check horizontal
    for (var row = 0; row < rows; row++) {
      String currentWord = '';
      final currentPositions = <(int, int)>[];
      
      for (var col = 0; col < cols; col++) {
        if (tiles[row][col] != null) {
          currentWord += tiles[row][col]!.letter;
          currentPositions.add((row, col));
        } else {
          if (currentWord == word) {
            positions.addAll(currentPositions);
          }
          currentWord = '';
          currentPositions.clear();
        }
      }
      if (currentWord == word) {
        positions.addAll(currentPositions);
      }
    }

    // Check vertical
    for (var col = 0; col < cols; col++) {
      String currentWord = '';
      final currentPositions = <(int, int)>[];
      
      for (var row = 0; row < rows; row++) {
        if (tiles[row][col] != null) {
          currentWord += tiles[row][col]!.letter;
          currentPositions.add((row, col));
        } else {
          if (currentWord == word) {
            positions.addAll(currentPositions);
          }
          currentWord = '';
          currentPositions.clear();
        }
      }
      if (currentWord == word) {
        positions.addAll(currentPositions);
      }
    }

    return positions;
  }
}
