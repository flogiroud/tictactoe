// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Local _$LocalFromJson(Map<String, dynamic> json) =>
    _Local($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LocalToJson(_Local instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

_Ai _$AiFromJson(Map<String, dynamic> json) => _Ai(
  difficulty: json['difficulty'] == null
      ? const AiDifficulty.hard()
      : AiDifficulty.fromJson(json['difficulty'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AiToJson(_Ai instance) => <String, dynamic>{
  'difficulty': instance.difficulty,
  'runtimeType': instance.$type,
};
