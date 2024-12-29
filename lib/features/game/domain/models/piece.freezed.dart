// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'piece.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Piece _$PieceFromJson(Map<String, dynamic> json) {
  return _Piece.fromJson(json);
}

/// @nodoc
mixin _$Piece {
  List<List<bool>> get shape => throw _privateConstructorUsedError;
  int get x => throw _privateConstructorUsedError;
  int get y => throw _privateConstructorUsedError;
  int get rotationState => throw _privateConstructorUsedError;
  TetrominoType get type => throw _privateConstructorUsedError;
  List<List<String>> get letters => throw _privateConstructorUsedError;

  /// Serializes this Piece to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PieceCopyWith<Piece> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PieceCopyWith<$Res> {
  factory $PieceCopyWith(Piece value, $Res Function(Piece) then) =
      _$PieceCopyWithImpl<$Res, Piece>;
  @useResult
  $Res call(
      {List<List<bool>> shape,
      int x,
      int y,
      int rotationState,
      TetrominoType type,
      List<List<String>> letters});
}

/// @nodoc
class _$PieceCopyWithImpl<$Res, $Val extends Piece>
    implements $PieceCopyWith<$Res> {
  _$PieceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? x = null,
    Object? y = null,
    Object? rotationState = null,
    Object? type = null,
    Object? letters = null,
  }) {
    return _then(_value.copyWith(
      shape: null == shape
          ? _value.shape
          : shape // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      rotationState: null == rotationState
          ? _value.rotationState
          : rotationState // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TetrominoType,
      letters: null == letters
          ? _value.letters
          : letters // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PieceImplCopyWith<$Res> implements $PieceCopyWith<$Res> {
  factory _$$PieceImplCopyWith(
          _$PieceImpl value, $Res Function(_$PieceImpl) then) =
      __$$PieceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<bool>> shape,
      int x,
      int y,
      int rotationState,
      TetrominoType type,
      List<List<String>> letters});
}

/// @nodoc
class __$$PieceImplCopyWithImpl<$Res>
    extends _$PieceCopyWithImpl<$Res, _$PieceImpl>
    implements _$$PieceImplCopyWith<$Res> {
  __$$PieceImplCopyWithImpl(
      _$PieceImpl _value, $Res Function(_$PieceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shape = null,
    Object? x = null,
    Object? y = null,
    Object? rotationState = null,
    Object? type = null,
    Object? letters = null,
  }) {
    return _then(_$PieceImpl(
      shape: null == shape
          ? _value._shape
          : shape // ignore: cast_nullable_to_non_nullable
              as List<List<bool>>,
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as int,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as int,
      rotationState: null == rotationState
          ? _value.rotationState
          : rotationState // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TetrominoType,
      letters: null == letters
          ? _value._letters
          : letters // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PieceImpl extends _Piece {
  const _$PieceImpl(
      {required final List<List<bool>> shape,
      required this.x,
      required this.y,
      required this.rotationState,
      required this.type,
      required final List<List<String>> letters})
      : _shape = shape,
        _letters = letters,
        super._();

  factory _$PieceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PieceImplFromJson(json);

  final List<List<bool>> _shape;
  @override
  List<List<bool>> get shape {
    if (_shape is EqualUnmodifiableListView) return _shape;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shape);
  }

  @override
  final int x;
  @override
  final int y;
  @override
  final int rotationState;
  @override
  final TetrominoType type;
  final List<List<String>> _letters;
  @override
  List<List<String>> get letters {
    if (_letters is EqualUnmodifiableListView) return _letters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_letters);
  }

  @override
  String toString() {
    return 'Piece(shape: $shape, x: $x, y: $y, rotationState: $rotationState, type: $type, letters: $letters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PieceImpl &&
            const DeepCollectionEquality().equals(other._shape, _shape) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.rotationState, rotationState) ||
                other.rotationState == rotationState) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._letters, _letters));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shape),
      x,
      y,
      rotationState,
      type,
      const DeepCollectionEquality().hash(_letters));

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      __$$PieceImplCopyWithImpl<_$PieceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PieceImplToJson(
      this,
    );
  }
}

abstract class _Piece extends Piece {
  const factory _Piece(
      {required final List<List<bool>> shape,
      required final int x,
      required final int y,
      required final int rotationState,
      required final TetrominoType type,
      required final List<List<String>> letters}) = _$PieceImpl;
  const _Piece._() : super._();

  factory _Piece.fromJson(Map<String, dynamic> json) = _$PieceImpl.fromJson;

  @override
  List<List<bool>> get shape;
  @override
  int get x;
  @override
  int get y;
  @override
  int get rotationState;
  @override
  TetrominoType get type;
  @override
  List<List<String>> get letters;

  /// Create a copy of Piece
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PieceImplCopyWith<_$PieceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
