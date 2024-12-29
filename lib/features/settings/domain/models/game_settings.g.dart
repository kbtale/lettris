// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSettingsImpl _$$GameSettingsImplFromJson(Map<String, dynamic> json) =>
    _$GameSettingsImpl(
      showAnimations: json['showAnimations'] as bool? ?? true,
      rotationDirection: $enumDecodeNullable(
              _$RotationDirectionEnumMap, json['rotationDirection']) ??
          RotationDirection.clockwise,
      enableTSpins: json['enableTSpins'] as bool? ?? true,
      showGhostPiece: json['showGhostPiece'] as bool? ?? true,
      touchSensitivity: (json['touchSensitivity'] as num?)?.toDouble() ?? 0.8,
      customControls: (json['customControls'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {},
    );

Map<String, dynamic> _$$GameSettingsImplToJson(_$GameSettingsImpl instance) =>
    <String, dynamic>{
      'showAnimations': instance.showAnimations,
      'rotationDirection':
          _$RotationDirectionEnumMap[instance.rotationDirection]!,
      'enableTSpins': instance.enableTSpins,
      'showGhostPiece': instance.showGhostPiece,
      'touchSensitivity': instance.touchSensitivity,
      'customControls': instance.customControls,
    };

const _$RotationDirectionEnumMap = {
  RotationDirection.clockwise: 'clockwise',
  RotationDirection.counterClockwise: 'counterClockwise',
  RotationDirection.both: 'both',
};
