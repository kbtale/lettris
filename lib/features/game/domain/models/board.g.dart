// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CellDataImpl _$$CellDataImplFromJson(Map<String, dynamic> json) =>
    _$CellDataImpl(
      color: _colorFromJson((json['color'] as num?)?.toInt()),
      letter: json['letter'] as String?,
    );

Map<String, dynamic> _$$CellDataImplToJson(_$CellDataImpl instance) =>
    <String, dynamic>{
      'color': _colorToJson(instance.color),
      'letter': instance.letter,
    };

_$BoardImpl _$$BoardImplFromJson(Map<String, dynamic> json) => _$BoardImpl(
      grid: (json['grid'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : CellData.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      currentPiece: json['currentPiece'] == null
          ? null
          : Piece.fromJson(json['currentPiece'] as Map<String, dynamic>),
      heldPiece: json['heldPiece'] == null
          ? null
          : Piece.fromJson(json['heldPiece'] as Map<String, dynamic>),
      isGameOver: json['isGameOver'] as bool? ?? false,
    );

Map<String, dynamic> _$$BoardImplToJson(_$BoardImpl instance) =>
    <String, dynamic>{
      'grid': instance.grid,
      'currentPiece': instance.currentPiece,
      'heldPiece': instance.heldPiece,
      'isGameOver': instance.isGameOver,
    };
