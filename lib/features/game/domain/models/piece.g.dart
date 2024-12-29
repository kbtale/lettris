// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piece.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PieceImpl _$$PieceImplFromJson(Map<String, dynamic> json) => _$PieceImpl(
      shape: (json['shape'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      rotationState: (json['rotationState'] as num).toInt(),
      type: $enumDecode(_$TetrominoTypeEnumMap, json['type']),
      letters: (json['letters'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as String).toList())
          .toList(),
    );

Map<String, dynamic> _$$PieceImplToJson(_$PieceImpl instance) =>
    <String, dynamic>{
      'shape': instance.shape,
      'x': instance.x,
      'y': instance.y,
      'rotationState': instance.rotationState,
      'type': _$TetrominoTypeEnumMap[instance.type]!,
      'letters': instance.letters,
    };

const _$TetrominoTypeEnumMap = {
  TetrominoType.I: 'I',
  TetrominoType.L: 'L',
  TetrominoType.J: 'J',
  TetrominoType.O: 'O',
  TetrominoType.S: 'S',
  TetrominoType.Z: 'Z',
  TetrominoType.T: 'T',
};
