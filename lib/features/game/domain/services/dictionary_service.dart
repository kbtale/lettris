import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

final dictionaryServiceProvider = Provider<DictionaryService>((ref) {
  return DictionaryService();
});

class WordSet {
  final String id;
  final String name;
  final String description;
  final bool isOfficial;
  final Set<String> words;

  WordSet({
    required this.id,
    required this.name,
    required this.description,
    required this.isOfficial,
    required this.words,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'isOfficial': isOfficial,
        'words': words.toList(),
      };

  factory WordSet.fromJson(Map<String, dynamic> json) => WordSet(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        isOfficial: json['isOfficial'],
        words: Set<String>.from(json['words']),
      );
}

class DictionaryService {
  Map<String, WordSet>? _wordSets;
  String? _activeWordSetId;
  static const String _wordSetsKey = 'word_sets';
  static const String _activeWordSetKey = 'active_word_set';

  Future<void> initialize() async {
    if (_wordSets != null) return;

    final prefs = await SharedPreferences.getInstance();
    _activeWordSetId = prefs.getString(_activeWordSetKey) ?? 'default_en';
    
    // Try to load from cache first
    final cachedSets = prefs.getString(_wordSetsKey);
    if (cachedSets != null) {
      final List<dynamic> decoded = json.decode(cachedSets);
      _wordSets = {
        for (var item in decoded)
          item['id']: WordSet.fromJson(item),
      };
    } else {
      // Load default English dictionary
      final String data = await rootBundle.loadString('assets/dictionary.txt');
      final defaultWords = Set<String>.from(
        data.split('\n').map((word) => word.trim().toLowerCase()),
      );

      _wordSets = {
        'default_en': WordSet(
          id: 'default_en',
          name: 'English',
          description: 'Official English dictionary',
          isOfficial: true,
          words: defaultWords,
        ),
      };

      // Cache the word sets
      await _saveWordSets();
    }
  }

  Future<void> _saveWordSets() async {
    if (_wordSets == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _wordSetsKey,
      json.encode(_wordSets!.values.map((ws) => ws.toJson()).toList()),
    );
  }

  Future<void> setActiveWordSet(String id) async {
    if (_wordSets?.containsKey(id) != true) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_activeWordSetKey, id);
    _activeWordSetId = id;
  }

  Future<void> addWordSet(WordSet wordSet) async {
    if (_wordSets == null) return;
    
    _wordSets![wordSet.id] = wordSet;
    await _saveWordSets();
  }

  List<WordSet> getWordSets() {
    if (_wordSets == null) return [];
    return _wordSets!.values.toList();
  }

  WordSet? getActiveWordSet() {
    if (_wordSets == null || _activeWordSetId == null) return null;
    return _wordSets![_activeWordSetId!];
  }

  bool isValidWord(String word) {
    final activeSet = getActiveWordSet();
    if (activeSet == null) return false;
    return activeSet.words.contains(word.toLowerCase());
  }

  List<String> findValidWords(List<String> candidates) {
    final activeSet = getActiveWordSet();
    if (activeSet == null) return [];
    return candidates
        .where((word) => activeSet.words.contains(word.toLowerCase()))
        .toList();
  }
}
