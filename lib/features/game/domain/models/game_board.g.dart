// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameBoardImpl _$$GameBoardImplFromJson(Map<String, dynamic> json) =>
    _$GameBoardImpl(
      tiles: (json['tiles'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => e == null
                  ? null
                  : LetterTile.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
      currentPiece: json['currentPiece'] == null
          ? null
          : Tetromino.fromJson(json['currentPiece'] as Map<String, dynamic>),
      isGameOver: json['isGameOver'] as bool? ?? false,
    );

Map<String, dynamic> _$$GameBoardImplToJson(_$GameBoardImpl instance) =>
    <String, dynamic>{
      'tiles': instance.tiles,
      'currentPiece': instance.currentPiece,
      'isGameOver': instance.isGameOver,
    };
