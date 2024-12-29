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
  int get minWordLength => throw _privateConstructorUsedError;
  bool get allowVerticalWords => throw _privateConstructorUsedError;
  bool get allowHorizontalWords => throw _privateConstructorUsedError;
  bool get onlyLongWords => throw _privateConstructorUsedError;
  int get longWordMinLength => throw _privateConstructorUsedError;

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
      {int minWordLength,
      bool allowVerticalWords,
      bool allowHorizontalWords,
      bool onlyLongWords,
      int longWordMinLength});
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
    Object? minWordLength = null,
    Object? allowVerticalWords = null,
    Object? allowHorizontalWords = null,
    Object? onlyLongWords = null,
    Object? longWordMinLength = null,
  }) {
    return _then(_value.copyWith(
      minWordLength: null == minWordLength
          ? _value.minWordLength
          : minWordLength // ignore: cast_nullable_to_non_nullable
              as int,
      allowVerticalWords: null == allowVerticalWords
          ? _value.allowVerticalWords
          : allowVerticalWords // ignore: cast_nullable_to_non_nullable
              as bool,
      allowHorizontalWords: null == allowHorizontalWords
          ? _value.allowHorizontalWords
          : allowHorizontalWords // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyLongWords: null == onlyLongWords
          ? _value.onlyLongWords
          : onlyLongWords // ignore: cast_nullable_to_non_nullable
              as bool,
      longWordMinLength: null == longWordMinLength
          ? _value.longWordMinLength
          : longWordMinLength // ignore: cast_nullable_to_non_nullable
              as int,
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
      {int minWordLength,
      bool allowVerticalWords,
      bool allowHorizontalWords,
      bool onlyLongWords,
      int longWordMinLength});
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
    Object? minWordLength = null,
    Object? allowVerticalWords = null,
    Object? allowHorizontalWords = null,
    Object? onlyLongWords = null,
    Object? longWordMinLength = null,
  }) {
    return _then(_$GameSettingsImpl(
      minWordLength: null == minWordLength
          ? _value.minWordLength
          : minWordLength // ignore: cast_nullable_to_non_nullable
              as int,
      allowVerticalWords: null == allowVerticalWords
          ? _value.allowVerticalWords
          : allowVerticalWords // ignore: cast_nullable_to_non_nullable
              as bool,
      allowHorizontalWords: null == allowHorizontalWords
          ? _value.allowHorizontalWords
          : allowHorizontalWords // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyLongWords: null == onlyLongWords
          ? _value.onlyLongWords
          : onlyLongWords // ignore: cast_nullable_to_non_nullable
              as bool,
      longWordMinLength: null == longWordMinLength
          ? _value.longWordMinLength
          : longWordMinLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSettingsImpl implements _GameSettings {
  const _$GameSettingsImpl(
      {this.minWordLength = 5,
      this.allowVerticalWords = true,
      this.allowHorizontalWords = true,
      this.onlyLongWords = false,
      this.longWordMinLength = 0});

  factory _$GameSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSettingsImplFromJson(json);

  @override
  @JsonKey()
  final int minWordLength;
  @override
  @JsonKey()
  final bool allowVerticalWords;
  @override
  @JsonKey()
  final bool allowHorizontalWords;
  @override
  @JsonKey()
  final bool onlyLongWords;
  @override
  @JsonKey()
  final int longWordMinLength;

  @override
  String toString() {
    return 'GameSettings(minWordLength: $minWordLength, allowVerticalWords: $allowVerticalWords, allowHorizontalWords: $allowHorizontalWords, onlyLongWords: $onlyLongWords, longWordMinLength: $longWordMinLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSettingsImpl &&
            (identical(other.minWordLength, minWordLength) ||
                other.minWordLength == minWordLength) &&
            (identical(other.allowVerticalWords, allowVerticalWords) ||
                other.allowVerticalWords == allowVerticalWords) &&
            (identical(other.allowHorizontalWords, allowHorizontalWords) ||
                other.allowHorizontalWords == allowHorizontalWords) &&
            (identical(other.onlyLongWords, onlyLongWords) ||
                other.onlyLongWords == onlyLongWords) &&
            (identical(other.longWordMinLength, longWordMinLength) ||
                other.longWordMinLength == longWordMinLength));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      minWordLength,
      allowVerticalWords,
      allowHorizontalWords,
      onlyLongWords,
      longWordMinLength);

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
      {final int minWordLength,
      final bool allowVerticalWords,
      final bool allowHorizontalWords,
      final bool onlyLongWords,
      final int longWordMinLength}) = _$GameSettingsImpl;

  factory _GameSettings.fromJson(Map<String, dynamic> json) =
      _$GameSettingsImpl.fromJson;

  @override
  int get minWordLength;
  @override
  bool get allowVerticalWords;
  @override
  bool get allowHorizontalWords;
  @override
  bool get onlyLongWords;
  @override
  int get longWordMinLength;

  /// Create a copy of GameSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameSettingsImplCopyWith<_$GameSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
