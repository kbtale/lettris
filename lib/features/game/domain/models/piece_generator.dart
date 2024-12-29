import 'dart:math';
import 'piece.dart';

class PieceGenerator {
  final Random _random = Random();
  List<TetrominoType> _currentBag = [];
  
  PieceGenerator() {
    _refillBag();
  }

  void _refillBag() {
    // Create a new bag with all piece types
    _currentBag = TetrominoType.values.toList();
    
    // Fisher-Yates shuffle algorithm
    for (var i = _currentBag.length - 1; i > 0; i--) {
      var j = _random.nextInt(i + 1);
      var temp = _currentBag[i];
      _currentBag[i] = _currentBag[j];
      _currentBag[j] = temp;
    }

    // Ensure first piece of first bag is I, J, L, or T (TGM Ace style)
    if (_currentBag.isEmpty) return;
    
    final validFirstPieces = [
      TetrominoType.I, 
      TetrominoType.J, 
      TetrominoType.L, 
      TetrominoType.T
    ];
    
    if (!validFirstPieces.contains(_currentBag[0])) {
      // Find the first valid piece in the bag
      for (var i = 1; i < _currentBag.length; i++) {
        if (validFirstPieces.contains(_currentBag[i])) {
          // Swap it with the first piece
          var temp = _currentBag[0];
          _currentBag[0] = _currentBag[i];
          _currentBag[i] = temp;
          break;
        }
      }
    }
  }

  TetrominoType nextPiece() {
    if (_currentBag.isEmpty) {
      _refillBag();
    }
    return _currentBag.removeLast();
  }

  // For debugging: get the current bag state
  List<TetrominoType> get currentBag => List.unmodifiable(_currentBag);
}
