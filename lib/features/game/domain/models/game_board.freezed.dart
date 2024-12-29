// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameBoard _$GameBoardFromJson(Map<String, dynamic> json) {
  return _GameBoard.fromJson(json);
}

/// @nodoc
mixin _$GameBoard {
  List<List<LetterTile?>> get tiles => throw _privateConstructorUsedError;
  Tetromino? get currentPiece => throw _privateConstructorUsedError;
  bool get isGameOver => throw _privateConstructorUsedError;

  /// Serializes this GameBoard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameBoardCopyWith<GameBoard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameBoardCopyWith<$Res> {
  factory $GameBoardCopyWith(GameBoard value, $Res Function(GameBoard) then) =
      _$GameBoardCopyWithImpl<$Res, GameBoard>;
  @useResult
  $Res call(
      {List<List<LetterTile?>> tiles,
      Tetromino? currentPiece,
      bool isGameOver});

  $TetrominoCopyWith<$Res>? get currentPiece;
}

/// @nodoc
class _$GameBoardCopyWithImpl<$Res, $Val extends GameBoard>
    implements $GameBoardCopyWith<$Res> {
  _$GameBoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tiles = null,
    Object? currentPiece = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_value.copyWith(
      tiles: null == tiles
          ? _value.tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<List<LetterTile?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Tetromino?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TetrominoCopyWith<$Res>? get currentPiece {
    if (_value.currentPiece == null) {
      return null;
    }

    return $TetrominoCopyWith<$Res>(_value.currentPiece!, (value) {
      return _then(_value.copyWith(currentPiece: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameBoardImplCopyWith<$Res>
    implements $GameBoardCopyWith<$Res> {
  factory _$$GameBoardImplCopyWith(
          _$GameBoardImpl value, $Res Function(_$GameBoardImpl) then) =
      __$$GameBoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<LetterTile?>> tiles,
      Tetromino? currentPiece,
      bool isGameOver});

  @override
  $TetrominoCopyWith<$Res>? get currentPiece;
}

/// @nodoc
class __$$GameBoardImplCopyWithImpl<$Res>
    extends _$GameBoardCopyWithImpl<$Res, _$GameBoardImpl>
    implements _$$GameBoardImplCopyWith<$Res> {
  __$$GameBoardImplCopyWithImpl(
      _$GameBoardImpl _value, $Res Function(_$GameBoardImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tiles = null,
    Object? currentPiece = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_$GameBoardImpl(
      tiles: null == tiles
          ? _value._tiles
          : tiles // ignore: cast_nullable_to_non_nullable
              as List<List<LetterTile?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Tetromino?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameBoardImpl extends _GameBoard {
  const _$GameBoardImpl(
      {required final List<List<LetterTile?>> tiles,
      required this.currentPiece,
      this.isGameOver = false})
      : _tiles = tiles,
        super._();

  factory _$GameBoardImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameBoardImplFromJson(json);

  final List<List<LetterTile?>> _tiles;
  @override
  List<List<LetterTile?>> get tiles {
    if (_tiles is EqualUnmodifiableListView) return _tiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tiles);
  }

  @override
  final Tetromino? currentPiece;
  @override
  @JsonKey()
  final bool isGameOver;

  @override
  String toString() {
    return 'GameBoard(tiles: $tiles, currentPiece: $currentPiece, isGameOver: $isGameOver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameBoardImpl &&
            const DeepCollectionEquality().equals(other._tiles, _tiles) &&
            (identical(other.currentPiece, currentPiece) ||
                other.currentPiece == currentPiece) &&
            (identical(other.isGameOver, isGameOver) ||
                other.isGameOver == isGameOver));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tiles), currentPiece, isGameOver);

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameBoardImplCopyWith<_$GameBoardImpl> get copyWith =>
      __$$GameBoardImplCopyWithImpl<_$GameBoardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameBoardImplToJson(
      this,
    );
  }
}

abstract class _GameBoard extends GameBoard {
  const factory _GameBoard(
      {required final List<List<LetterTile?>> tiles,
      required final Tetromino? currentPiece,
      final bool isGameOver}) = _$GameBoardImpl;
  const _GameBoard._() : super._();

  factory _GameBoard.fromJson(Map<String, dynamic> json) =
      _$GameBoardImpl.fromJson;

  @override
  List<List<LetterTile?>> get tiles;
  @override
  Tetromino? get currentPiece;
  @override
  bool get isGameOver;

  /// Create a copy of GameBoard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameBoardImplCopyWith<_$GameBoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
