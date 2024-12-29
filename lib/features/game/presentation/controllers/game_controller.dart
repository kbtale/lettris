import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/board.dart';
import '../../domain/models/piece.dart';
import 'achievement_controller.dart';

final gameControllerProvider = StateNotifierProvider<GameController, GameState>((ref) {
  return GameController(ref);
});

class GameState {
  final Board board;
  final int score;
  final int level;
  final int linesCleared;
  final List<Piece> upcomingPieces;

  GameState({
    required this.board,
    this.score = 0,
    this.level = 1,
    this.linesCleared = 0,
    this.upcomingPieces = const [],
  });

  GameState copyWith({
    Board? board,
    int? score,
    int? level,
    int? linesCleared,
    List<Piece>? upcomingPieces,
  }) {
    return GameState(
      board: board ?? this.board,
      score: score ?? this.score,
      level: level ?? this.level,
      linesCleared: linesCleared ?? this.linesCleared,
      upcomingPieces: upcomingPieces ?? this.upcomingPieces,
    );
  }
}

class GameController extends StateNotifier<GameState> {
  Timer? _gameLoop;
  bool _hardDropInProgress = false;
  bool _softDropInProgress = false;
  Timer? _softDropTimer;
  bool _canHold = true;
  final TetrominoBag _pieceBag = TetrominoBag();
  final Ref _ref;

  GameController(this._ref) : super(GameState(board: Board.empty(rows: 20, cols: 10), upcomingPieces: [])) {
    _startGame();
  }

  void _startGame() {
    _generateNewPiece();
    _startTimer();
  }

  void _generateNewPiece() {
    if (state.board.currentPiece == null) {
      // Initial game start - get next piece and peek 5 upcoming pieces
      final currentType = _pieceBag.nextPiece(); // Actually consume the first piece
      final upcomingTypes = _pieceBag.peekNextNPieces(5); // Peek the next 5
      
      final currentPiece = _createPiece(currentType);
      final upcomingPieces = upcomingTypes.map((type) => _createPiece(type)).toList();
      
      state = state.copyWith(
        board: state.board.copyWith(currentPiece: currentPiece),
        upcomingPieces: upcomingPieces,
      );
    } else {
      // Check if next piece can be placed
      final nextPiece = state.upcomingPieces[0];
      if (!state.board.isValidMove(nextPiece.x, nextPiece.y, nextPiece.shape)) {
        // Game over
        state = state.copyWith(
          board: state.board.copyWith(isGameOver: true),
        );
        _gameLoop?.cancel();
        return;
      }

      // Actually consume the next piece from the bag
      _pieceBag.nextPiece(); // Consume the piece we're about to use
      final newType = _pieceBag.nextPiece(); // Get a new piece for the end
      final newPiece = _createPiece(newType);
      
      state = state.copyWith(
        board: state.board.copyWith(currentPiece: nextPiece),
        upcomingPieces: [...state.upcomingPieces.skip(1), newPiece],
      );
    }
  }

  Piece _createPiece(TetrominoType type) {
    return Piece.create(
      x: (state.board.cols ~/ 2) - 1,
      y: 0,
      type: type,
    );
  }

  void _startTimer() {
    _gameLoop?.cancel();
    _gameLoop = Timer.periodic(_getDropInterval(), (_) => _dropPiece());
  }

  Duration _getDropInterval() {
    // Base interval is 1000ms, decreases by 50ms per level, minimum 100ms
    final interval = max(100, 1000 - (state.level - 1) * 50);
    return Duration(milliseconds: interval);
  }

  void _dropPiece() {
    if (state.board.currentPiece == null) return;

    final currentPiece = state.board.currentPiece!;
    final newY = currentPiece.y + 1;

    if (state.board.isValidMove(currentPiece.x, newY, currentPiece.shape)) {
      state = state.copyWith(
        board: state.board.copyWith(
          currentPiece: currentPiece.copyWith(y: newY),
        ),
      );
    } else {
      _lockPieceAndUpdate();
    }
  }

  void _lockPieceAndUpdate() {
    if (state.board.currentPiece == null) return;

    // Lock the piece
    var newBoard = state.board.lockPiece();

    // Clear lines and calculate score
    var result = newBoard.clearLinesAndCalculateScore();
    newBoard = newBoard.copyWith(grid: result.newGrid);
    
    // Update score and lines cleared
    if (result.score > 0 || result.linesCleared > 0) {
      final newLinesCleared = state.linesCleared + result.linesCleared;
      final newScore = state.score + result.score;
      
      state = state.copyWith(
        board: newBoard,
        score: newScore,
        linesCleared: newLinesCleared,
        level: (newLinesCleared ~/ 10) + 1,
      );

      // Update achievements
      final achievementController = _ref.read(achievementControllerProvider.notifier);
      
      // Track words formed
      if (result.words.isNotEmpty) {
        for (final word in result.words) {
          achievementController.onWordFormed(word);
        }
        print('Words formed: ${result.words.join(", ")}');
        print('Score gained: ${result.score}');
      }

      // Track perfect lines
      if (result.linesCleared > 0) {
        achievementController.onPerfectLine();
      }

      // Track total score
      achievementController.onScoreUpdate(newScore);
    } else {
      state = state.copyWith(board: newBoard);
    }

    _onPieceLocked();

    // Generate next piece
    _generateNewPiece();
  }

  void _onPieceLocked() {
    _canHold = true;  // Reset hold ability when piece is locked
  }

  int _countClearedLines(List<List<CellData?>> oldGrid, List<List<CellData?>> newGrid) {
    int count = 0;
    for (var row = 0; row < oldGrid.length; row++) {
      if (oldGrid[row].every((cell) => cell != null) && 
          newGrid[row].every((cell) => cell == null)) {
        count++;
      }
    }
    return count;
  }

  int _calculateScore(int linesCleared, int level) {
    // Score multiplier increases with more lines cleared at once
    final multiplier = switch (linesCleared) {
      1 => 40,
      2 => 100,
      3 => 300,
      4 => 1200,
      _ => 0,
    };
    return multiplier * level;
  }

  void moveLeft() {
    if (state.board.currentPiece == null) return;

    final currentPiece = state.board.currentPiece!;
    final newX = currentPiece.x - 1;

    if (state.board.isValidMove(newX, currentPiece.y, currentPiece.shape)) {
      state = state.copyWith(
        board: state.board.copyWith(
          currentPiece: currentPiece.copyWith(x: newX),
        ),
      );
    }
  }

  void moveRight() {
    if (state.board.currentPiece == null) return;

    final currentPiece = state.board.currentPiece!;
    final newX = currentPiece.x + 1;

    if (state.board.isValidMove(newX, currentPiece.y, currentPiece.shape)) {
      state = state.copyWith(
        board: state.board.copyWith(
          currentPiece: currentPiece.copyWith(x: newX),
        ),
      );
    }
  }

  List<List<T>> _rotateClockwise<T>(List<List<T>> matrix) {
    int n = matrix.length;
    var rotated = List.generate(
      n,
      (i) => List.generate(n, (j) => matrix[n - 1 - j][i], growable: false),
      growable: false,
    );
    return rotated;
  }

  List<List<T>> _rotateCounterClockwise<T>(List<List<T>> matrix) {
    int n = matrix.length;
    var rotated = List.generate(
      n,
      (i) => List.generate(n, (j) => matrix[j][n - 1 - i], growable: false),
      growable: false,
    );
    return rotated;
  }

  List<List<T>> _rotate180<T>(List<List<T>> matrix) {
    int n = matrix.length;
    var rotated = List.generate(
      n,
      (i) => List.generate(n, (j) => matrix[n - 1 - i][n - 1 - j], growable: false),
      growable: false,
    );
    return rotated;
  }

  void rotate({bool clockwise = true, bool rotate180 = false}) {
    final currentPiece = state.board.currentPiece;
    if (currentPiece == null) return;

    List<List<bool>> rotatedShape;
    List<List<String>> rotatedLetters;
    int newRotationState;

    if (rotate180) {
      rotatedShape = _rotate180(currentPiece.shape);
      rotatedLetters = _rotate180(currentPiece.letters);
      newRotationState = (currentPiece.rotationState + 2) % 4;
    } else {
      rotatedShape = clockwise
          ? _rotateClockwise(currentPiece.shape)
          : _rotateCounterClockwise(currentPiece.shape);
      rotatedLetters = clockwise
          ? _rotateClockwise(currentPiece.letters)
          : _rotateCounterClockwise(currentPiece.letters);
      newRotationState = clockwise
          ? (currentPiece.rotationState + 1) % 4
          : (currentPiece.rotationState + 3) % 4;
    }

    final rotatedPiece = Piece(
      shape: rotatedShape,
      letters: rotatedLetters,
      type: currentPiece.type,
      x: currentPiece.x,
      y: currentPiece.y,
      rotationState: newRotationState,
    );

    if (state.board.isValidMove(rotatedPiece.x, rotatedPiece.y, rotatedPiece.shape)) {
      state = state.copyWith(
        board: state.board.copyWith(currentPiece: rotatedPiece),
      );
    }
  }

  void holdPiece() {
    if (!_canHold || state.board.currentPiece == null) return;

    final currentPiece = state.board.currentPiece;
    final heldPiece = state.board.heldPiece;
    
    Piece? newCurrentPiece;
    if (heldPiece != null) {
      // If there's a held piece, place it at the current piece's position
      newCurrentPiece = heldPiece.copyWith(
        x: (state.board.cols ~/ 2) - 1,
        y: 0,
      );
    } else {
      // If there's no held piece, generate a new piece
      newCurrentPiece = _createPiece(_pieceBag.nextPiece());
    }

    state = state.copyWith(
      board: state.board.copyWith(
        heldPiece: currentPiece,
        currentPiece: newCurrentPiece,
      ),
    );

    _canHold = false;
  }

  void hardDrop() {
    if (_hardDropInProgress || state.board.currentPiece == null) return;
    _hardDropInProgress = true;

    final shadowPiece = state.board.getShadowPiece();
    if (shadowPiece == null) return;

    // Lock the piece at shadow position
    state = state.copyWith(
      board: state.board.copyWith(
        currentPiece: shadowPiece,
      ),
    );

    _lockPieceAndUpdate();

    _hardDropInProgress = false;
  }

  void startSoftDrop() {
    if (_softDropInProgress) return;
    _softDropInProgress = true;
    _gameLoop?.cancel();
    _softDropTimer = Timer.periodic(
      const Duration(milliseconds: 50),
      (_) => _dropPiece(),
    );
  }

  void endSoftDrop() {
    if (!_softDropInProgress) return;
    _softDropInProgress = false;
    _softDropTimer?.cancel();
    _startTimer();
  }

  @override
  void dispose() {
    _gameLoop?.cancel();
    _softDropTimer?.cancel();
    super.dispose();
  }
}
