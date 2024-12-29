// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Score _$ScoreFromJson(Map<String, dynamic> json) {
  return _Score.fromJson(json);
}

/// @nodoc
mixin _$Score {
  int get currentScore => throw _privateConstructorUsedError;
  int get highScore => throw _privateConstructorUsedError;
  int get backToBackCount => throw _privateConstructorUsedError;
  bool get lastWasBackToBack => throw _privateConstructorUsedError;
  double get multiplier => throw _privateConstructorUsedError;

  /// Serializes this Score to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Score
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreCopyWith<Score> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreCopyWith<$Res> {
  factory $ScoreCopyWith(Score value, $Res Function(Score) then) =
      _$ScoreCopyWithImpl<$Res, Score>;
  @useResult
  $Res call(
      {int currentScore,
      int highScore,
      int backToBackCount,
      bool lastWasBackToBack,
      double multiplier});
}

/// @nodoc
class _$ScoreCopyWithImpl<$Res, $Val extends Score>
    implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Score
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScore = null,
    Object? highScore = null,
    Object? backToBackCount = null,
    Object? lastWasBackToBack = null,
    Object? multiplier = null,
  }) {
    return _then(_value.copyWith(
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      highScore: null == highScore
          ? _value.highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as int,
      backToBackCount: null == backToBackCount
          ? _value.backToBackCount
          : backToBackCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastWasBackToBack: null == lastWasBackToBack
          ? _value.lastWasBackToBack
          : lastWasBackToBack // ignore: cast_nullable_to_non_nullable
              as bool,
      multiplier: null == multiplier
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScoreImplCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$$ScoreImplCopyWith(
          _$ScoreImpl value, $Res Function(_$ScoreImpl) then) =
      __$$ScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentScore,
      int highScore,
      int backToBackCount,
      bool lastWasBackToBack,
      double multiplier});
}

/// @nodoc
class __$$ScoreImplCopyWithImpl<$Res>
    extends _$ScoreCopyWithImpl<$Res, _$ScoreImpl>
    implements _$$ScoreImplCopyWith<$Res> {
  __$$ScoreImplCopyWithImpl(
      _$ScoreImpl _value, $Res Function(_$ScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of Score
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScore = null,
    Object? highScore = null,
    Object? backToBackCount = null,
    Object? lastWasBackToBack = null,
    Object? multiplier = null,
  }) {
    return _then(_$ScoreImpl(
      currentScore: null == currentScore
          ? _value.currentScore
          : currentScore // ignore: cast_nullable_to_non_nullable
              as int,
      highScore: null == highScore
          ? _value.highScore
          : highScore // ignore: cast_nullable_to_non_nullable
              as int,
      backToBackCount: null == backToBackCount
          ? _value.backToBackCount
          : backToBackCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastWasBackToBack: null == lastWasBackToBack
          ? _value.lastWasBackToBack
          : lastWasBackToBack // ignore: cast_nullable_to_non_nullable
              as bool,
      multiplier: null == multiplier
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreImpl implements _Score {
  const _$ScoreImpl(
      {this.currentScore = 0,
      this.highScore = 0,
      this.backToBackCount = 0,
      this.lastWasBackToBack = false,
      this.multiplier = 1.0});

  factory _$ScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreImplFromJson(json);

  @override
  @JsonKey()
  final int currentScore;
  @override
  @JsonKey()
  final int highScore;
  @override
  @JsonKey()
  final int backToBackCount;
  @override
  @JsonKey()
  final bool lastWasBackToBack;
  @override
  @JsonKey()
  final double multiplier;

  @override
  String toString() {
    return 'Score(currentScore: $currentScore, highScore: $highScore, backToBackCount: $backToBackCount, lastWasBackToBack: $lastWasBackToBack, multiplier: $multiplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreImpl &&
            (identical(other.currentScore, currentScore) ||
                other.currentScore == currentScore) &&
            (identical(other.highScore, highScore) ||
                other.highScore == highScore) &&
            (identical(other.backToBackCount, backToBackCount) ||
                other.backToBackCount == backToBackCount) &&
            (identical(other.lastWasBackToBack, lastWasBackToBack) ||
                other.lastWasBackToBack == lastWasBackToBack) &&
            (identical(other.multiplier, multiplier) ||
                other.multiplier == multiplier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentScore, highScore,
      backToBackCount, lastWasBackToBack, multiplier);

  /// Create a copy of Score
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreImplCopyWith<_$ScoreImpl> get copyWith =>
      __$$ScoreImplCopyWithImpl<_$ScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreImplToJson(
      this,
    );
  }
}

abstract class _Score implements Score {
  const factory _Score(
      {final int currentScore,
      final int highScore,
      final int backToBackCount,
      final bool lastWasBackToBack,
      final double multiplier}) = _$ScoreImpl;

  factory _Score.fromJson(Map<String, dynamic> json) = _$ScoreImpl.fromJson;

  @override
  int get currentScore;
  @override
  int get highScore;
  @override
  int get backToBackCount;
  @override
  bool get lastWasBackToBack;
  @override
  double get multiplier;

  /// Create a copy of Score
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreImplCopyWith<_$ScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
