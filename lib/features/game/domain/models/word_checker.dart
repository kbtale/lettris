import 'dart:io';
import 'package:flutter/services.dart';

class WordChecker {
  static Set<String> _dictionary = {};
  
  static Future<void> initialize() async {
    try {
      final String content = await File('assets/dictionary.txt').readAsString();
      _dictionary = content.split('\n').map((word) => word.trim().toUpperCase()).toSet();
    } catch (e) {
      print('Error loading dictionary: $e');
      _dictionary = {};
    }
  }

  static bool isValidWord(String word) {
    return word.length >= 3 && _dictionary.contains(word.toUpperCase());
  }
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

class Position {
  final int row;
  final int col;

  Position(this.row, this.col);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          col == other.col;

  @override
  int get hashCode => row.hashCode ^ col.hashCode;
}
