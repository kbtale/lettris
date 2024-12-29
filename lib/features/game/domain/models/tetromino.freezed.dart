// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tetromino.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tetromino _$TetrominoFromJson(Map<String, dynamic> json) {
  return _Tetromino.fromJson(json);
}

/// @nodoc
mixin _$Tetromino {
  List<List<LetterTile?>> get shape => throw _privateConstructorUsedError;
  int get rotationState => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;

  /// Serializes this Tetromino to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tetromino
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TetrominoCopyWith<Tetromino> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TetrominoCopyWith<$Res> {
  factory $TetrominoCopyWith(Tetromino value, $Res Function(Tetromino) then) =
      _$TetrominoCopyWithImpl<$Res, Tetromino>;
  @useResult
  $Res call(
      {List<List<LetterTile?>> shape, int rotationState, int row, int col});
}

/// @nodoc
class _$TetrominoCopyWithImpl<$Res, $Val extends Tetromino>
    implements $TetrominoCopyWith<$Res> {
  _$TetrominoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tetromino
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? rotationState = null,
    Object? row = null,
    Object? col = null,
  }) {
    return _then(_value.copyWith(
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as List<List<LetterTile?>>,
      rotationState: null == rotationState
          ? _value.rotationState
          : rotationState // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TetrominoImplCopyWith<$Res>
    implements $TetrominoCopyWith<$Res> {
  factory _$$TetrominoImplCopyWith(
          _$TetrominoImpl value, $Res Function(_$TetrominoImpl) then) =
      __$$TetrominoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<LetterTile?>> shape, int rotationState, int row, int col});
}

/// @nodoc
class __$$TetrominoImplCopyWithImpl<$Res>
    extends _$TetrominoCopyWithImpl<$Res, _$TetrominoImpl>
    implements _$$TetrominoImplCopyWith<$Res> {
  __$$TetrominoImplCopyWithImpl(
      _$TetrominoImpl _value, $Res Function(_$TetrominoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tetromino
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? rotationState = null,
    Object? row = null,
    Object? col = null,
  }) {
    return _then(_$TetrominoImpl(
      shape: null == shape
          ? _value._shape
          : shape // ignore: cast_nullable_to_non_nullable
              as List<List<LetterTile?>>,
      rotationState: null == rotationState
          ? _value.rotationState
          : rotationState // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TetrominoImpl extends _Tetromino {
  const _$TetrominoImpl(
      {required final List<List<LetterTile?>> shape,
      required this.rotationState,
      required this.row,
      required this.col})
      : _shape = shape,
        super._();

  factory _$TetrominoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TetrominoImplFromJson(json);

  final List<List<LetterTile?>> _shape;
  @override
  List<List<LetterTile?>> get shape {
    if (_shape is EqualUnmodifiableListView) return _shape;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shape);
  }

  @override
  final int rotationState;
  @override
  final int row;
  @override
  final int col;

  @override
  String toString() {
    return 'Tetromino(shape: $shape, rotationState: $rotationState, row: $row, col: $col)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TetrominoImpl &&
            const DeepCollectionEquality().equals(other._shape, _shape) &&
            (identical(other.rotationState, rotationState) ||
                other.rotationState == rotationState) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_shape), rotationState, row, col);

  /// Create a copy of Tetromino
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TetrominoImplCopyWith<_$TetrominoImpl> get copyWith =>
      __$$TetrominoImplCopyWithImpl<_$TetrominoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TetrominoImplToJson(
      this,
    );
  }
}

abstract class _Tetromino extends Tetromino {
  const factory _Tetromino(
      {required final List<List<LetterTile?>> shape,
      required final int rotationState,
      required final int row,
      required final int col}) = _$TetrominoImpl;
  const _Tetromino._() : super._();

  factory _Tetromino.fromJson(Map<String, dynamic> json) =
      _$TetrominoImpl.fromJson;

  @override
  List<List<LetterTile?>> get shape;
  @override
  int get rotationState;
  @override
  int get row;
  @override
  int get col;

  /// Create a copy of Tetromino
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TetrominoImplCopyWith<_$TetrominoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
