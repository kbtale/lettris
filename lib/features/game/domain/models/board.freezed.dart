// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CellData _$CellDataFromJson(Map<String, dynamic> json) {
  return _CellData.fromJson(json);
}

/// @nodoc
mixin _$CellData {
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color? get color => throw _privateConstructorUsedError;
  String? get letter => throw _privateConstructorUsedError;

  /// Serializes this CellData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CellData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CellDataCopyWith<CellData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CellDataCopyWith<$Res> {
  factory $CellDataCopyWith(CellData value, $Res Function(CellData) then) =
      _$CellDataCopyWithImpl<$Res, CellData>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color? color,
      String? letter});
}

/// @nodoc
class _$CellDataCopyWithImpl<$Res, $Val extends CellData>
    implements $CellDataCopyWith<$Res> {
  _$CellDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CellData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? letter = freezed,
  }) {
    return _then(_value.copyWith(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      letter: freezed == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CellDataImplCopyWith<$Res>
    implements $CellDataCopyWith<$Res> {
  factory _$$CellDataImplCopyWith(
          _$CellDataImpl value, $Res Function(_$CellDataImpl) then) =
      __$$CellDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color? color,
      String? letter});
}

/// @nodoc
class __$$CellDataImplCopyWithImpl<$Res>
    extends _$CellDataCopyWithImpl<$Res, _$CellDataImpl>
    implements _$$CellDataImplCopyWith<$Res> {
  __$$CellDataImplCopyWithImpl(
      _$CellDataImpl _value, $Res Function(_$CellDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CellData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? color = freezed,
    Object? letter = freezed,
  }) {
    return _then(_$CellDataImpl(
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      letter: freezed == letter
          ? _value.letter
          : letter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CellDataImpl implements _CellData {
  const _$CellDataImpl(
      {@JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) this.color,
      this.letter});

  factory _$CellDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CellDataImplFromJson(json);

  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color? color;
  @override
  final String? letter;

  @override
  String toString() {
    return 'CellData(color: $color, letter: $letter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CellDataImpl &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.letter, letter) || other.letter == letter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, color, letter);

  /// Create a copy of CellData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CellDataImplCopyWith<_$CellDataImpl> get copyWith =>
      __$$CellDataImplCopyWithImpl<_$CellDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CellDataImplToJson(
      this,
    );
  }
}

abstract class _CellData implements CellData {
  const factory _CellData(
      {@JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      final Color? color,
      final String? letter}) = _$CellDataImpl;

  factory _CellData.fromJson(Map<String, dynamic> json) =
      _$CellDataImpl.fromJson;

  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color? get color;
  @override
  String? get letter;

  /// Create a copy of CellData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CellDataImplCopyWith<_$CellDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Board _$BoardFromJson(Map<String, dynamic> json) {
  return _Board.fromJson(json);
}

/// @nodoc
mixin _$Board {
  List<List<CellData?>> get grid => throw _privateConstructorUsedError;
  Piece? get currentPiece => throw _privateConstructorUsedError;
  Piece? get heldPiece => throw _privateConstructorUsedError;
  bool get isGameOver => throw _privateConstructorUsedError;

  /// Serializes this Board to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call(
      {List<List<CellData?>> grid,
      Piece? currentPiece,
      Piece? heldPiece,
      bool isGameOver});

  $PieceCopyWith<$Res>? get currentPiece;
  $PieceCopyWith<$Res>? get heldPiece;
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grid = null,
    Object? currentPiece = freezed,
    Object? heldPiece = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_value.copyWith(
      grid: null == grid
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as List<List<CellData?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      heldPiece: freezed == heldPiece
          ? _value.heldPiece
          : heldPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PieceCopyWith<$Res>? get currentPiece {
    if (_value.currentPiece == null) {
      return null;
    }

    return $PieceCopyWith<$Res>(_value.currentPiece!, (value) {
      return _then(_value.copyWith(currentPiece: value) as $Val);
    });
  }

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PieceCopyWith<$Res>? get heldPiece {
    if (_value.heldPiece == null) {
      return null;
    }

    return $PieceCopyWith<$Res>(_value.heldPiece!, (value) {
      return _then(_value.copyWith(heldPiece: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoardImplCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$BoardImplCopyWith(
          _$BoardImpl value, $Res Function(_$BoardImpl) then) =
      __$$BoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<CellData?>> grid,
      Piece? currentPiece,
      Piece? heldPiece,
      bool isGameOver});

  @override
  $PieceCopyWith<$Res>? get currentPiece;
  @override
  $PieceCopyWith<$Res>? get heldPiece;
}

/// @nodoc
class __$$BoardImplCopyWithImpl<$Res>
    extends _$BoardCopyWithImpl<$Res, _$BoardImpl>
    implements _$$BoardImplCopyWith<$Res> {
  __$$BoardImplCopyWithImpl(
      _$BoardImpl _value, $Res Function(_$BoardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grid = null,
    Object? currentPiece = freezed,
    Object? heldPiece = freezed,
    Object? isGameOver = null,
  }) {
    return _then(_$BoardImpl(
      grid: null == grid
          ? _value._grid
          : grid // ignore: cast_nullable_to_non_nullable
              as List<List<CellData?>>,
      currentPiece: freezed == currentPiece
          ? _value.currentPiece
          : currentPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      heldPiece: freezed == heldPiece
          ? _value.heldPiece
          : heldPiece // ignore: cast_nullable_to_non_nullable
              as Piece?,
      isGameOver: null == isGameOver
          ? _value.isGameOver
          : isGameOver // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardImpl extends _Board {
  const _$BoardImpl(
      {required final List<List<CellData?>> grid,
      this.currentPiece,
      this.heldPiece,
      this.isGameOver = false})
      : _grid = grid,
        super._();

  factory _$BoardImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardImplFromJson(json);

  final List<List<CellData?>> _grid;
  @override
  List<List<CellData?>> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  @override
  final Piece? currentPiece;
  @override
  final Piece? heldPiece;
  @override
  @JsonKey()
  final bool isGameOver;

  @override
  String toString() {
    return 'Board(grid: $grid, currentPiece: $currentPiece, heldPiece: $heldPiece, isGameOver: $isGameOver)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardImpl &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            (identical(other.currentPiece, currentPiece) ||
                other.currentPiece == currentPiece) &&
            (identical(other.heldPiece, heldPiece) ||
                other.heldPiece == heldPiece) &&
            (identical(other.isGameOver, isGameOver) ||
                other.isGameOver == isGameOver));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_grid),
      currentPiece,
      heldPiece,
      isGameOver);

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      __$$BoardImplCopyWithImpl<_$BoardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardImplToJson(
      this,
    );
  }
}

abstract class _Board extends Board {
  const factory _Board(
      {required final List<List<CellData?>> grid,
      final Piece? currentPiece,
      final Piece? heldPiece,
      final bool isGameOver}) = _$BoardImpl;
  const _Board._() : super._();

  factory _Board.fromJson(Map<String, dynamic> json) = _$BoardImpl.fromJson;

  @override
  List<List<CellData?>> get grid;
  @override
  Piece? get currentPiece;
  @override
  Piece? get heldPiece;
  @override
  bool get isGameOver;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
