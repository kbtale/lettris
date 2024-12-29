import 'package:freezed_annotation/freezed_annotation.dart';

part 'letter_tile.freezed.dart';
part 'letter_tile.g.dart';

@freezed
class LetterTile with _$LetterTile {
  const factory LetterTile({
    required String letter,
    required int row,
    required int col,
    @Default(1) int points, // Base points for this letter
    @Default(false) bool isSelected,
    @Default(false) bool isLocked,
  }) = _LetterTile;

  factory LetterTile.fromJson(Map<String, dynamic> json) =>
      _$LetterTileFromJson(json);
}
