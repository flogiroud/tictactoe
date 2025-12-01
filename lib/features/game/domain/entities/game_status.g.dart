// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Playing _$PlayingFromJson(Map<String, dynamic> json) =>
    _Playing($type: json['runtimeType'] as String?);

Map<String, dynamic> _$PlayingToJson(_Playing instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};

_Won _$WonFromJson(Map<String, dynamic> json) => _Won(
  $enumDecode(_$PlayerEnumMap, json['winner']),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$WonToJson(_Won instance) => <String, dynamic>{
  'winner': _$PlayerEnumMap[instance.winner]!,
  'runtimeType': instance.$type,
};

const _$PlayerEnumMap = {Player.p1: 'p1', Player.p2: 'p2'};

_Draw _$DrawFromJson(Map<String, dynamic> json) =>
    _Draw($type: json['runtimeType'] as String?);

Map<String, dynamic> _$DrawToJson(_Draw instance) => <String, dynamic>{
  'runtimeType': instance.$type,
};
