// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Game _$GameFromJson(Map<String, dynamic> json) => _Game(
  board: Board.fromJson(json['board'] as Map<String, dynamic>),
  currentPlayer: $enumDecode(_$PlayerEnumMap, json['currentPlayer']),
  status: GameStatus.fromJson(json['status'] as Map<String, dynamic>),
  mode: GameMode.fromJson(json['mode'] as Map<String, dynamic>),
  winningLine:
      (json['winningLine'] as List<dynamic>?)
          ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  moveCount: (json['moveCount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GameToJson(_Game instance) => <String, dynamic>{
  'board': instance.board,
  'currentPlayer': _$PlayerEnumMap[instance.currentPlayer]!,
  'status': instance.status,
  'mode': instance.mode,
  'winningLine': instance.winningLine,
  'moveCount': instance.moveCount,
};

const _$PlayerEnumMap = {Player.p1: 'p1', Player.p2: 'p2'};
