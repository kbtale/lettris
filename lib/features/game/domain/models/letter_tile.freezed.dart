// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'letter_tile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LetterTile _$LetterTileFromJson(Map<String, dynamic> json) {
  return _LetterTile.fromJson(json);
}

/// @nodoc
mixin _$LetterTile {
  String get letter => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;
  int get points =>
      throw _privateConstructorUsedError; // Base points for this letter
  bool get isSelected => throw _privateConstructorUsedError;
  bool get isLocked => throw _privateConstructorUsedError;

  /// Serializes this LetterTile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LetterTile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LetterTileCopyWith<LetterTile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LetterTileCopyWith<$Res> {
  factory $LetterTileCopyWith(
          LetterTile value, $Res Function(LetterTile) then) =
      _$LetterTileCopyWithImpl<$Res, LetterTile>;
  @useResult
  $Res call(
      {String letter,
      int row,
      int col,
      int points,
      bool isSelected,
      bool isLocked});
}

/// @nodoc
class _$LetterTileCopyWithImpl<$Res, $Val extends LetterTile>
    implements $LetterTileCopyWith<$Res> {
  _$LetterTileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LetterTile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? row = null,
    Object? col = null,
    Object? points = null,
    Object? isSelected = null,
    Object? isLocked = null,
  }) {
    return _then(_value.copyWith(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LetterTileImplCopyWith<$Res>
    implements $LetterTileCopyWith<$Res> {
  factory _$$LetterTileImplCopyWith(
          _$LetterTileImpl value, $Res Function(_$LetterTileImpl) then) =
      __$$LetterTileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String letter,
      int row,
      int col,
      int points,
      bool isSelected,
      bool isLocked});
}

/// @nodoc
class __$$LetterTileImplCopyWithImpl<$Res>
    extends _$LetterTileCopyWithImpl<$Res, _$LetterTileImpl>
    implements _$$LetterTileImplCopyWith<$Res> {
  __$$LetterTileImplCopyWithImpl(
      _$LetterTileImpl _value, $Res Function(_$LetterTileImpl) _then)
      : super(_value, _then);

  /// Create a copy of LetterTile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? letter = null,
    Object? row = null,
    Object? col = null,
    Object? points = null,
    Object? isSelected = null,
    Object? isLocked = null,
  }) {
    return _then(_$LetterTileImpl(
      letter: null == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LetterTileImpl implements _LetterTile {
  const _$LetterTileImpl(
      {required this.letter,
      required this.row,
      required this.col,
      this.points = 1,
      this.isSelected = false,
      this.isLocked = false});

  factory _$LetterTileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LetterTileImplFromJson(json);

  @override
  final String letter;
  @override
  final int row;
  @override
  final int col;
  @override
  @JsonKey()
  final int points;
// Base points for this letter
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final bool isLocked;

  @override
  String toString() {
    return 'LetterTile(letter: $letter, row: $row, col: $col, points: $points, isSelected: $isSelected, isLocked: $isLocked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LetterTileImpl &&
            (identical(other.letter, letter) || other.letter == letter) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, letter, row, col, points, isSelected, isLocked);

  /// Create a copy of LetterTile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LetterTileImplCopyWith<_$LetterTileImpl> get copyWith =>
      __$$LetterTileImplCopyWithImpl<_$LetterTileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LetterTileImplToJson(
      this,
    );
  }
}

abstract class _LetterTile implements LetterTile {
  const factory _LetterTile(
      {required final String letter,
      required final int row,
      required final int col,
      final int points,
      final bool isSelected,
      final bool isLocked}) = _$LetterTileImpl;

  factory _LetterTile.fromJson(Map<String, dynamic> json) =
      _$LetterTileImpl.fromJson;

  @override
  String get letter;
  @override
  int get row;
  @override
  int get col;
  @override
  int get points; // Base points for this letter
  @override
  bool get isSelected;
  @override
  bool get isLocked;

  /// Create a copy of LetterTile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LetterTileImplCopyWith<_$LetterTileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
