// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'letter_tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LetterTileImpl _$$LetterTileImplFromJson(Map<String, dynamic> json) =>
    _$LetterTileImpl(
      letter: json['letter'] as String,
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
      points: (json['points'] as num?)?.toInt() ?? 1,
      isSelected: json['isSelected'] as bool? ?? false,
      isLocked: json['isLocked'] as bool? ?? false,
    );

Map<String, dynamic> _$$LetterTileImplToJson(_$LetterTileImpl instance) =>
    <String, dynamic>{
      'letter': instance.letter,
      'row': instance.row,
      'col': instance.col,
      'points': instance.points,
      'isSelected': instance.isSelected,
      'isLocked': instance.isLocked,
    };
