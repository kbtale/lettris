import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lettris/features/game/domain/models/board.dart';

void main() {
  group('Board Tests', () {
    test('empty board creation', () {
      final board = Board.empty(rows: 20, cols: 10);
      expect(board.rows, 20);
      expect(board.cols, 10);
      expect(board.isGameOver, false);
      for (var row = 0; row < board.rows; row++) {
        for (var col = 0; col < board.cols; col++) {
          expect(board.grid[row][col], null);
        }
      }
    });

    test('isValidMove bounds check', () {
      final board = Board.empty(rows: 20, cols: 10);
      final shape = [
        [true, true],
        [true, true]
      ];
      expect(board.isValidMove(0, 0, shape), true);
      expect(board.isValidMove(-1, 0, shape), false);
      expect(board.isValidMove(9, 0, shape), false);
      expect(board.isValidMove(0, 19, shape), false);
    });

    test('isValidMove collision check', () {
      var grid = List.generate(
        20,
        (_) => List<CellData?>.filled(10, null),
      );
      grid[10][5] = const CellData(letter: 'X', color: Colors.red);
      final board = Board(grid: grid);
      
      final shape = [[true]];
      expect(board.isValidMove(5, 10, shape), false);
      expect(board.isValidMove(4, 10, shape), true);
    });

    test('word detection and clearing', () {
      var grid = List.generate(
        20,
        (_) => List<CellData?>.filled(10, null),
      );
      grid[15][0] = const CellData(letter: 'W', color: Colors.blue);
      grid[15][1] = const CellData(letter: 'O', color: Colors.blue);
      grid[15][2] = const CellData(letter: 'R', color: Colors.blue);
      grid[15][3] = const CellData(letter: 'D', color: Colors.blue);

      final board = Board(grid: grid);
      final result = board.clearLinesAndCalculateScore((word) => word == 'WORD');

      expect(result.words, ['WORD']);
      expect(result.score, greaterThan(0));
      expect(result.newGrid[15][0], null);
      expect(result.newGrid[15][1], null);
      expect(result.newGrid[15][2], null);
      expect(result.newGrid[15][3], null);
    });

    test('complete lines clearing', () {
      var grid = List.generate(
        20,
        (_) => List<CellData?>.filled(10, null),
      );
      for (var col = 0; col < 10; col++) {
        grid[19][col] = const CellData(letter: 'A', color: Colors.red);
      }

      final board = Board(grid: grid);
      final result = board.clearLinesAndCalculateScore((word) => false);

      expect(result.linesCleared, 1);
      expect(result.score, 100);
      for (var col = 0; col < 10; col++) {
        expect(result.newGrid[19][col], null);
      }
    });
  });
}
