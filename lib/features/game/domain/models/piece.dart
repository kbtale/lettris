import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:math';

part 'piece.freezed.dart';
part 'piece.g.dart';

enum TetrominoType {
  I,  // Cyan
  L,  // Orange
  J,  // Blue
  O,  // Yellow
  S,  // Green
  Z,  // Red
  T   // Purple
}

class TetrominoBag {
  List<TetrominoType> _currentBag = [];
  List<TetrominoType> _nextBag = [];
  final Random _random = Random();

  TetrominoBag() {
    _fillAndShuffleBag(_currentBag);
    _fillAndShuffleBag(_nextBag);
    print('Initial bags:');
    print('Current: $_currentBag');
    print('Next: $_nextBag');
  }

  void _fillAndShuffleBag(List<TetrominoType> bag) {
    bag.clear();
    bag.addAll(TetrominoType.values);
    bag.shuffle(_random);
  }

  TetrominoType nextPiece() {
    print('Before nextPiece - Current bag: $_currentBag');
    if (_currentBag.isEmpty) {
      print('Current bag empty, swapping with next bag');
      _currentBag = List.from(_nextBag); // Create a new list to avoid reference issues
      _nextBag = [];
      _fillAndShuffleBag(_nextBag);
      print('After swap - Current: $_currentBag, Next: $_nextBag');
    }
    final piece = _currentBag.removeAt(0);
    print('Returning piece: $piece, Remaining in current: $_currentBag');
    return piece;
  }

  List<TetrominoType> peekNextNPieces(int n) {
    print('Peeking $n pieces');
    List<TetrominoType> pieces = [];
    List<TetrominoType> tempCurrentBag = List.from(_currentBag);
    List<TetrominoType> tempNextBag = List.from(_nextBag);
    print('Temp bags - Current: $tempCurrentBag, Next: $tempNextBag');

    for (int i = 0; i < n; i++) {
      if (tempCurrentBag.isEmpty) {
        print('Temp current bag empty, swapping with next');
        tempCurrentBag = List.from(tempNextBag);
        tempNextBag = [];
        _fillAndShuffleBag(tempNextBag);
      }
      pieces.add(tempCurrentBag.removeAt(0));
    }

    print('Peeked pieces: $pieces');
    return pieces;
  }
}

@freezed
class Piece with _$Piece {
  const Piece._();

  const factory Piece({
    required List<List<bool>> shape,
    required int x,
    required int y,
    required int rotationState,
    required TetrominoType type,
    required List<List<String>> letters,
  }) = _Piece;

  factory Piece.fromJson(Map<String, dynamic> json) => _$PieceFromJson(json);

  factory Piece.create({
    required int x,
    required int y,
    required TetrominoType type,
  }) {
    final shape = List<List<bool>>.from(
      tetrominos[type]!.map((row) => List<bool>.from(row))
    );
  
    // Generate letters for the piece
    final letters = _generateLettersForPiece(shape);

    return Piece(
      shape: shape,
      x: x,
      y: y,
      rotationState: 0,
      type: type,
      letters: letters,
    );
  }

  static List<List<String>> _generateLettersForPiece(List<List<bool>> shape) {
    final random = Random();
    final vowels = ['A', 'E', 'I', 'O', 'U'];
    final consonants = [
      'B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M',
      'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Y', 'Z'
    ];

    // Count total blocks in the shape
    int totalBlocks = 0;
    for (var row in shape) {
      for (var block in row) {
        if (block) totalBlocks++;
      }
    }

    // Create list of required letters
    List<String> pieceLetters = [];

    // Add 2 vowels
    for (int i = 0; i < 2; i++) {
      pieceLetters.add(vowels[random.nextInt(vowels.length)]);
    }

    // Add 2 consonants
    for (int i = 0; i < 2; i++) {
      pieceLetters.add(consonants[random.nextInt(consonants.length)]);
    }

    // Fill remaining blocks with random letters if needed
    while (pieceLetters.length < totalBlocks) {
      if (random.nextBool()) {
        pieceLetters.add(vowels[random.nextInt(vowels.length)]);
      } else {
        pieceLetters.add(consonants[random.nextInt(consonants.length)]);
      }
    }

    // Shuffle all letters
    pieceLetters.shuffle(random);

    // Create the 2D letter grid
    List<List<String>> letterGrid = List.generate(
      shape.length,
      (i) => List.generate(shape[i].length, (j) => '', growable: false),
      growable: false,
    );

    // Place letters in the grid where there are blocks
    int letterIndex = 0;
    for (int i = 0; i < shape.length; i++) {
      for (int j = 0; j < shape[i].length; j++) {
        if (shape[i][j]) {
          letterGrid[i][j] = pieceLetters[letterIndex++];
        }
      }
    }

    return letterGrid;
  }

  static final Map<TetrominoType, List<List<bool>>> tetrominos = {
    TetrominoType.I: [
      [false, false, false, false],
      [true, true, true, true],
      [false, false, false, false],
      [false, false, false, false],
    ],
    TetrominoType.J: [
      [true, false, false],
      [true, true, true],
      [false, false, false],
    ],
    TetrominoType.L: [
      [false, false, true],
      [true, true, true],
      [false, false, false],
    ],
    TetrominoType.O: [
      [true, true],
      [true, true],
    ],
    TetrominoType.S: [
      [false, true, true],
      [true, true, false],
      [false, false, false],
    ],
    TetrominoType.Z: [
      [true, true, false],
      [false, true, true],
      [false, false, false],
    ],
    TetrominoType.T: [
      [false, true, false],
      [true, true, true],
      [false, false, false],
    ],
  };

  static final Map<TetrominoType, Color> colors = {
    TetrominoType.I: Colors.cyan,
    TetrominoType.L: Colors.orange,
    TetrominoType.J: Colors.blue,
    TetrominoType.O: Colors.yellow,
    TetrominoType.S: Colors.green,
    TetrominoType.Z: Colors.red,
    TetrominoType.T: Colors.purple,
  };

  static const Map<String, int> letterFrequency = {
    'E': 12, 'A': 9, 'I': 9, 'O': 8, 'N': 6, 'R': 6, 'T': 6, 'L': 4, 'S': 4, 'U': 4,
    'D': 4, 'G': 3, 'B': 2, 'C': 2, 'M': 2, 'P': 2, 'F': 2, 'H': 2, 'V': 2, 'W': 2,
    'Y': 2, 'K': 1, 'J': 1, 'X': 1, 'Q': 1, 'Z': 1,
  };

  Color get color => colors[type]!;

  // Helper function to get all points of a shape
  static List<(int, int)> _getPoints(List<List<bool>> shape) {
    final points = <(int, int)>[];
    for (var r = 0; r < shape.length; r++) {
      for (var c = 0; c < shape[0].length; c++) {
        if (shape[r][c]) {
          points.add((r, c));
        }
      }
    }
    return points;
  }

  // Helper function to convert points back to shape matrix
  static List<List<bool>> _pointsToShape(List<(int, int)> points, int rows, int cols) {
    final shape = List.generate(rows, (_) => List.filled(cols, false));
    for (final point in points) {
      if (point.$1 >= 0 && point.$1 < rows && point.$2 >= 0 && point.$2 < cols) {
        shape[point.$1][point.$2] = true;
      }
    }
    return shape;
  }

  // Rotation offset data for JLSTZ pieces
  static const Map<int, List<(int, int)>> jlstzOffsetData = {
    0: [(0, 0), (0, 0), (0, 0), (0, 0), (0, 0)],
    1: [(0, 0), (1, 0), (1, -1), (0, 2), (1, 2)],
    2: [(0, 0), (0, 0), (0, 0), (0, 0), (0, 0)],
    3: [(0, 0), (-1, 0), (-1, -1), (0, 2), (-1, 2)],
  };

  // Rotation offset data for I piece
  static const Map<int, List<(int, int)>> iOffsetData = {
    0: [(0, 0), (-1, 0), (2, 0), (-1, 0), (2, 0)],
    1: [(-1, 0), (0, 0), (0, 0), (0, 1), (0, -2)],
    2: [(-1, 1), (1, 1), (-2, 1), (1, 0), (-2, 0)],
    3: [(0, 1), (0, 1), (0, 1), (0, -1), (0, 2)],
  };

  // Rotation offset data for O piece
  static const Map<int, List<(int, int)>> oOffsetData = {
    0: [(0, 0)],
    1: [(0, -1)],
    2: [(-1, -1)],
    3: [(-1, 0)],
  };

  List<(int, int)> getWallKickData(int fromState, int toState) {
    if (type == TetrominoType.O) {
      return [(0, 0)]; // O piece doesn't need wall kicks
    }

    final fromOffsets = type == TetrominoType.I 
        ? iOffsetData[fromState]!
        : jlstzOffsetData[fromState]!;

    final toOffsets = type == TetrominoType.I
        ? iOffsetData[toState]!
        : jlstzOffsetData[toState]!;

    // Calculate kick translations by taking the difference between offset pairs
    return List.generate(fromOffsets.length, (i) {
      final (fromX, fromY) = fromOffsets[i];
      final (toX, toY) = toOffsets[i];
      return (fromX - toX, fromY - toY);
    });
  }

  Piece rotate({bool clockwise = true, bool rotate180 = false}) {
    print('\n=== ROTATE CALLED ===');
    print('Type: $type');
    print('Clockwise: $clockwise');
    print('Rotate180: $rotate180');
    print('Current rotation state: $rotationState');

    if (rotate180) {
      // I, O, S, and Z pieces should remain the same in 180° rotation
      if (type == TetrominoType.I || type == TetrominoType.O || 
          type == TetrominoType.S || type == TetrominoType.Z) {
        print('Skipping 180° rotation for piece type: $type');
        return this;
      }
      print('Performing 180° rotation');
      // For 180° rotation, rotate clockwise twice
      final firstRotation = rotate(clockwise: true);
      return firstRotation.rotate(clockwise: true);
    }

    // Calculate new rotation state
    final newState = clockwise 
        ? (rotationState + 1) % 4  // Clockwise: 0->1->2->3->0
        : (rotationState + 3) % 4; // Counter-clockwise: 0->3->2->1->0

    print('Attempting rotation from state $rotationState to $newState');

    // Get the basic rotated shape and letters
    final rows = shape.length;
    final cols = shape[0].length;
    var newShape = List.generate(cols, (_) => List.filled(rows, false));
    var newLetters = List.generate(cols, (_) => List.filled(rows, ''));

    // Perform rotation for both shape and letters
    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        if (clockwise) {
          newShape[col][rows - 1 - row] = shape[row][col];
          newLetters[col][rows - 1 - row] = letters[row][col];
        } else {
          newShape[cols - 1 - col][row] = shape[row][col];
          newLetters[cols - 1 - col][row] = letters[row][col];
        }
      }
    }

    print('Shape before rotation:');
    shape.forEach((row) => print(row));
    print('Shape after rotation:');
    newShape.forEach((row) => print(row));
    
    return copyWith(
      shape: newShape,
      letters: newLetters,
      rotationState: newState,
    );
  }
}
