// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameSettings _$GameSettingsFromJson(Map<String, dynamic> json) {
  return _GameSettings.fromJson(json);
}

/// @nodoc
mixin _$GameSettings {
  bool get showAnimations => throw _privateConstructorUsedError;
  RotationDirection get rotationDirection => throw _privateConstructorUsedError;
  bool get enableTSpins => throw _privateConstructorUsedError;
  bool get showGhostPiece => throw _privateConstructorUsedError;
  double get touchSensitivity => throw _privateConstructorUsedError;
  Map<String, String> get customControls => throw _privateConstructorUsedError;

  /// Serializes this GameSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameSettingsCopyWith<GameSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSettingsCopyWith<$Res> {
  factory $GameSettingsCopyWith(
          GameSettings value, $Res Function(GameSettings) then) =
      _$GameSettingsCopyWithImpl<$Res, GameSettings>;
  @useResult
  $Res call(
      {bool showAnimations,
      RotationDirection rotationDirection,
      bool enableTSpins,
      bool showGhostPiece,
      double touchSensitivity,
      Map<String, String> customControls});
}

/// @nodoc
class _$GameSettingsCopyWithImpl<$Res, $Val extends GameSettings>
    implements $GameSettingsCopyWith<$Res> {
  _$GameSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAnimations = null,
    Object? rotationDirection = null,
    Object? enableTSpins = null,
    Object? showGhostPiece = null,
    Object? touchSensitivity = null,
    Object? customControls = null,
  }) {
    return _then(_value.copyWith(
      showAnimations: null == showAnimations
          ? _value.showAnimations
          : showAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationDirection: null == rotationDirection
          ? _value.rotationDirection
          : rotationDirection // ignore: cast_nullable_to_non_nullable
              as RotationDirection,
      enableTSpins: null == enableTSpins
          ? _value.enableTSpins
          : enableTSpins // ignore: cast_nullable_to_non_nullable
              as bool,
      showGhostPiece: null == showGhostPiece
          ? _value.showGhostPiece
          : showGhostPiece // ignore: cast_nullable_to_non_nullable
              as bool,
      touchSensitivity: null == touchSensitivity
          ? _value.touchSensitivity
          : touchSensitivity // ignore: cast_nullable_to_non_nullable
              as double,
      customControls: null == customControls
          ? _value.customControls
          : customControls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSettingsImplCopyWith<$Res>
    implements $GameSettingsCopyWith<$Res> {
  factory _$$GameSettingsImplCopyWith(
          _$GameSettingsImpl value, $Res Function(_$GameSettingsImpl) then) =
      __$$GameSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showAnimations,
      RotationDirection rotationDirection,
      bool enableTSpins,
      bool showGhostPiece,
      double touchSensitivity,
      Map<String, String> customControls});
}

/// @nodoc
class __$$GameSettingsImplCopyWithImpl<$Res>
    extends _$GameSettingsCopyWithImpl<$Res, _$GameSettingsImpl>
    implements _$$GameSettingsImplCopyWith<$Res> {
  __$$GameSettingsImplCopyWithImpl(
      _$GameSettingsImpl _value, $Res Function(_$GameSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showAnimations = null,
    Object? rotationDirection = null,
    Object? enableTSpins = null,
    Object? showGhostPiece = null,
    Object? touchSensitivity = null,
    Object? customControls = null,
  }) {
    return _then(_$GameSettingsImpl(
      showAnimations: null == showAnimations
          ? _value.showAnimations
          : showAnimations // ignore: cast_nullable_to_non_nullable
              as bool,
      rotationDirection: null == rotationDirection
          ? _value.rotationDirection
          : rotationDirection // ignore: cast_nullable_to_non_nullable
              as RotationDirection,
      enableTSpins: null == enableTSpins
          ? _value.enableTSpins
          : enableTSpins // ignore: cast_nullable_to_non_nullable
              as bool,
      showGhostPiece: null == showGhostPiece
          ? _value.showGhostPiece
          : showGhostPiece // ignore: cast_nullable_to_non_nullable
              as bool,
      touchSensitivity: null == touchSensitivity
          ? _value.touchSensitivity
          : touchSensitivity // ignore: cast_nullable_to_non_nullable
              as double,
      customControls: null == customControls
          ? _value._customControls
          : customControls // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSettingsImpl implements _GameSettings {
  const _$GameSettingsImpl(
      {this.showAnimations = true,
      this.rotationDirection = RotationDirection.clockwise,
      this.enableTSpins = true,
      this.showGhostPiece = true,
      this.touchSensitivity = 0.8,
      final Map<String, String> customControls = const {}})
      : _customControls = customControls;

  factory _$GameSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool showAnimations;
  @override
  @JsonKey()
  final RotationDirection rotationDirection;
  @override
  @JsonKey()
  final bool enableTSpins;
  @override
  @JsonKey()
  final bool showGhostPiece;
  @override
  @JsonKey()
  final double touchSensitivity;
  final Map<String, String> _customControls;
  @override
  @JsonKey()
  Map<String, String> get customControls {
    if (_customControls is EqualUnmodifiableMapView) return _customControls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_customControls);
  }

  @override
  String toString() {
    return 'GameSettings(showAnimations: $showAnimations, rotationDirection: $rotationDirection, enableTSpins: $enableTSpins, showGhostPiece: $showGhostPiece, touchSensitivity: $touchSensitivity, customControls: $customControls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsImpl &&
            (identical(other.showAnimations, showAnimations) ||
                other.showAnimations == showAnimations) &&
            (identical(other.rotationDirection, rotationDirection) ||
                other.rotationDirection == rotationDirection) &&
            (identical(other.enableTSpins, enableTSpins) ||
                other.enableTSpins == enableTSpins) &&
            (identical(other.showGhostPiece, showGhostPiece) ||
                other.showGhostPiece == showGhostPiece) &&
            (identical(other.touchSensitivity, touchSensitivity) ||
                other.touchSensitivity == touchSensitivity) &&
            const DeepCollectionEquality()
                .equals(other._customControls, _customControls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      showAnimations,
      rotationDirection,
      enableTSpins,
      showGhostPiece,
      touchSensitivity,
      const DeepCollectionEquality().hash(_customControls));

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      __$$GameSettingsImplCopyWithImpl<_$GameSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSettingsImplToJson(
      this,
    );
  }
}

abstract class _GameSettings implements GameSettings {
  const factory _GameSettings(
      {final bool showAnimations,
      final RotationDirection rotationDirection,
      final bool enableTSpins,
      final bool showGhostPiece,
      final double touchSensitivity,
      final Map<String, String> customControls}) = _$GameSettingsImpl;

  factory _GameSettings.fromJson(Map<String, dynamic> json) =
      _$GameSettingsImpl.fromJson;

  @override
  bool get showAnimations;
  @override
  RotationDirection get rotationDirection;
  @override
  bool get enableTSpins;
  @override
  bool get showGhostPiece;
  @override
  double get touchSensitivity;
  @override
  Map<String, String> get customControls;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
