// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tetromino.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TetrominoImpl _$$TetrominoImplFromJson(Map<String, dynamic> json) =>
    _$TetrominoImpl(
      shape: (json['shape'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : LetterTile.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      rotationState: (json['rotationState'] as num).toInt(),
      row: (json['row'] as num).toInt(),
      col: (json['col'] as num).toInt(),
    );

Map<String, dynamic> _$$TetrominoImplToJson(_$TetrominoImpl instance) =>
    <String, dynamic>{
      'shape': instance.shape,
      'rotationState': instance.rotationState,
      'row': instance.row,
      'col': instance.col,
    };
