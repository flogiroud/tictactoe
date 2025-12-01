// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Board _$BoardFromJson(Map<String, dynamic> json) => _Board(
  size: (json['size'] as num?)?.toInt() ?? kDefaultBoardSize,
  cells: (json['cells'] as List<dynamic>)
      .map((e) => $enumDecode(_$CellStateEnumMap, e))
      .toList(),
);

Map<String, dynamic> _$BoardToJson(_Board instance) => <String, dynamic>{
  'size': instance.size,
  'cells': instance.cells.map((e) => _$CellStateEnumMap[e]!).toList(),
};

const _$CellStateEnumMap = {
  CellState.empty: 'empty',
  CellState.p1: 'p1',
  CellState.p2: 'p2',
};
