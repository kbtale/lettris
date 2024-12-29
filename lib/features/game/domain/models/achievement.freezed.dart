// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  AchievementType get type => throw _privateConstructorUsedError;
  int get threshold => throw _privateConstructorUsedError;
  bool get unlocked => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
          Achievement value, $Res Function(Achievement) then) =
      _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      int threshold,
      bool unlocked,
      DateTime? unlockedAt});
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? threshold = null,
    Object? unlocked = null,
    Object? unlockedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int,
      unlocked: null == unlocked
          ? _value.unlocked
          : unlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
          _$AchievementImpl value, $Res Function(_$AchievementImpl) then) =
      __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      AchievementType type,
      int threshold,
      bool unlocked,
      DateTime? unlockedAt});
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
      _$AchievementImpl _value, $Res Function(_$AchievementImpl) _then)
      : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? threshold = null,
    Object? unlocked = null,
    Object? unlockedAt = freezed,
  }) {
    return _then(_$AchievementImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AchievementType,
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as int,
      unlocked: null == unlocked
          ? _value.unlocked
          : unlocked // ignore: cast_nullable_to_non_nullable
              as bool,
      unlockedAt: freezed == unlockedAt
          ? _value.unlockedAt
          : unlockedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.type,
      required this.threshold,
      this.unlocked = false,
      this.unlockedAt});

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final AchievementType type;
  @override
  final int threshold;
  @override
  @JsonKey()
  final bool unlocked;
  @override
  final DateTime? unlockedAt;

  @override
  String toString() {
    return 'Achievement(id: $id, title: $title, description: $description, type: $type, threshold: $threshold, unlocked: $unlocked, unlockedAt: $unlockedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold) &&
            (identical(other.unlocked, unlocked) ||
                other.unlocked == unlocked) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, type,
      threshold, unlocked, unlockedAt);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(
      this,
    );
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement(
      {required final String id,
      required final String title,
      required final String description,
      required final AchievementType type,
      required final int threshold,
      final bool unlocked,
      final DateTime? unlockedAt}) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  AchievementType get type;
  @override
  int get threshold;
  @override
  bool get unlocked;
  @override
  DateTime? get unlockedAt;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AchievementProgress _$AchievementProgressFromJson(Map<String, dynamic> json) {
  return _AchievementProgress.fromJson(json);
}

/// @nodoc
mixin _$AchievementProgress {
  Map<AchievementType, int> get progress => throw _privateConstructorUsedError;
  List<Achievement> get achievements => throw _privateConstructorUsedError;

  /// Serializes this AchievementProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementProgressCopyWith<AchievementProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementProgressCopyWith<$Res> {
  factory $AchievementProgressCopyWith(
          AchievementProgress value, $Res Function(AchievementProgress) then) =
      _$AchievementProgressCopyWithImpl<$Res, AchievementProgress>;
  @useResult
  $Res call(
      {Map<AchievementType, int> progress, List<Achievement> achievements});
}

/// @nodoc
class _$AchievementProgressCopyWithImpl<$Res, $Val extends AchievementProgress>
    implements $AchievementProgressCopyWith<$Res> {
  _$AchievementProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? achievements = null,
  }) {
    return _then(_value.copyWith(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Map<AchievementType, int>,
      achievements: null == achievements
          ? _value.achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AchievementProgressImplCopyWith<$Res>
    implements $AchievementProgressCopyWith<$Res> {
  factory _$$AchievementProgressImplCopyWith(_$AchievementProgressImpl value,
          $Res Function(_$AchievementProgressImpl) then) =
      __$$AchievementProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<AchievementType, int> progress, List<Achievement> achievements});
}

/// @nodoc
class __$$AchievementProgressImplCopyWithImpl<$Res>
    extends _$AchievementProgressCopyWithImpl<$Res, _$AchievementProgressImpl>
    implements _$$AchievementProgressImplCopyWith<$Res> {
  __$$AchievementProgressImplCopyWithImpl(_$AchievementProgressImpl _value,
      $Res Function(_$AchievementProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? achievements = null,
  }) {
    return _then(_$AchievementProgressImpl(
      progress: null == progress
          ? _value._progress
          : progress // ignore: cast_nullable_to_non_nullable
              as Map<AchievementType, int>,
      achievements: null == achievements
          ? _value._achievements
          : achievements // ignore: cast_nullable_to_non_nullable
              as List<Achievement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementProgressImpl implements _AchievementProgress {
  const _$AchievementProgressImpl(
      {final Map<AchievementType, int> progress = const {},
      final List<Achievement> achievements = const []})
      : _progress = progress,
        _achievements = achievements;

  factory _$AchievementProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementProgressImplFromJson(json);

  final Map<AchievementType, int> _progress;
  @override
  @JsonKey()
  Map<AchievementType, int> get progress {
    if (_progress is EqualUnmodifiableMapView) return _progress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_progress);
  }

  final List<Achievement> _achievements;
  @override
  @JsonKey()
  List<Achievement> get achievements {
    if (_achievements is EqualUnmodifiableListView) return _achievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_achievements);
  }

  @override
  String toString() {
    return 'AchievementProgress(progress: $progress, achievements: $achievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementProgressImpl &&
            const DeepCollectionEquality().equals(other._progress, _progress) &&
            const DeepCollectionEquality()
                .equals(other._achievements, _achievements));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_progress),
      const DeepCollectionEquality().hash(_achievements));

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementProgressImplCopyWith<_$AchievementProgressImpl> get copyWith =>
      __$$AchievementProgressImplCopyWithImpl<_$AchievementProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementProgressImplToJson(
      this,
    );
  }
}

abstract class _AchievementProgress implements AchievementProgress {
  const factory _AchievementProgress(
      {final Map<AchievementType, int> progress,
      final List<Achievement> achievements}) = _$AchievementProgressImpl;

  factory _AchievementProgress.fromJson(Map<String, dynamic> json) =
      _$AchievementProgressImpl.fromJson;

  @override
  Map<AchievementType, int> get progress;
  @override
  List<Achievement> get achievements;

  /// Create a copy of AchievementProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementProgressImplCopyWith<_$AchievementProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
