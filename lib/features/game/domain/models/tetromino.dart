import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'letter_tile.dart';

part 'tetromino.freezed.dart';
part 'tetromino.g.dart';

@freezed
class Tetromino with _$Tetromino {
  const Tetromino._();  

  const factory Tetromino({
    required List<List<LetterTile?>> shape,
    required int rotationState,
    required int row,
    required int col,
  }) = _Tetromino;

  factory Tetromino.fromJson(Map<String, dynamic> json) =>
      _$TetrominoFromJson(json);

  static const List<List<List<bool>>> tetrominoShapes = [
    // I
    [
      [false, false, false, false],
      [true, true, true, true],
      [false, false, false, false],
      [false, false, false, false],
    ],
    // L
    [
      [true, false, false],
      [true, false, false],
      [true, true, false],
    ],
    // J
    [
      [false, false, true],
      [false, false, true],
      [false, true, true],
    ],
    // O
    [
      [true, true],
      [true, true],
    ],
    // S
    [
      [false, true, true],
      [true, true, false],
      [false, false, false],
    ],
    // Z
    [
      [true, true, false],
      [false, true, true],
      [false, false, false],
    ],
    // T
    [
      [true, true, true],
      [false, true, false],
      [false, false, false],
    ],
  ];

  static const List<String> commonLetters = [
    'E', 'T', 'A', 'O', 'I', 'N', 'S', 'H', 'R', 'D', 'L', 'U'
  ];
  static const List<String> uncommonLetters = [
    'G', 'B', 'C', 'M', 'P', 'F', 'W', 'Y', 'V', 'K'
  ];
  static const List<String> rareLetters = [
    'X', 'J', 'Q', 'Z'
  ];

  static Tetromino generateRandom() {
    final random = Random();
    final shapeIndex = random.nextInt(tetrominoShapes.length);
    final shape = tetrominoShapes[shapeIndex];

    // Convert the boolean shape to LetterTiles
    final letterShape = List.generate(
      shape.length,
      (row) => List.generate(
        shape[row].length,
        (col) {
          if (!shape[row][col]) return null;

          // Weight letter selection
          final letterPool = random.nextDouble() < 0.7
              ? commonLetters
              : random.nextDouble() < 0.9
                  ? uncommonLetters
                  : rareLetters;

          return LetterTile(
            letter: letterPool[random.nextInt(letterPool.length)],
            row: row,
            col: col,
            points: _getPointsForLetter(letterPool),
          );
        },
      ),
    );

    return Tetromino(
      shape: letterShape,
      rotationState: 0,
      row: 0,
      col: 3, // Start in the middle
    );
  }

  static int _getPointsForLetter(List<String> letterPool) {
    if (letterPool == rareLetters) return 8;
    if (letterPool == uncommonLetters) return 4;
    return 1;
  }
}
