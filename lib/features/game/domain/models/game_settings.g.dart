// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSettingsImpl _$$GameSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GameSettingsImpl(
      minWordLength: (json['minWordLength'] as num?)?.toInt() ?? 5,
      allowVerticalWords: json['allowVerticalWords'] as bool? ?? true,
      allowHorizontalWords: json['allowHorizontalWords'] as bool? ?? true,
      onlyLongWords: json['onlyLongWords'] as bool? ?? false,
      longWordMinLength: (json['longWordMinLength'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GameSettingsImplToJson(_$GameSettingsImpl instance) =>
    <String, dynamic>{
      'minWordLength': instance.minWordLength,
      'allowVerticalWords': instance.allowVerticalWords,
      'allowHorizontalWords': instance.allowHorizontalWords,
      'onlyLongWords': instance.onlyLongWords,
      'longWordMinLength': instance.longWordMinLength,
    };
