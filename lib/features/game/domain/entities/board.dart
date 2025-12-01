import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/constants/app_constants.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
sealed class Board with _$Board {
  const factory Board({
    @Default(kDefaultBoardSize) int size,
    required List<CellState> cells,
  }) = _Board;

  const Board._();

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);

  factory Board.empty({int size = kDefaultBoardSize}) =>
      Board(size: size, cells: List.filled(size * size, CellState.empty));

  CellState getAt(Position pos) {
    if (!pos.isValid(size)) {
      throw ArgumentError('Position $pos is out of bounds for size $size');
    }
    return cells[index(pos)];
  }

  CellState getAtIndex(int index) {
    if (index < 0 || index >= cells.length) {
      throw RangeError('index must be between 0 and ${cells.length - 1}');
    }
    return cells[index];
  }

  Board setAt(Position pos, CellState value) {
    if (!pos.isValid(size)) {
      throw ArgumentError('Position $pos is out of bounds for size $size');
    }

    final newCells = List<CellState>.from(cells);

    newCells[index(pos)] = value;
    return copyWith(cells: newCells);
  }

  int index(Position pos) => pos.row * size + pos.col;

  Position posFromIndex(int index) =>
      Position(row: index ~/ size, col: index % size);

  Iterable<Position> get positions sync* {
    for (var r = 0; r < size; r++) {
      for (var c = 0; c < size; c++) {
        yield Position(row: r, col: c);
      }
    }
  }

  bool get isFull => cells.every((cell) => !cell.isEmpty);

  bool get isEmpty => cells.every((cell) => cell.isEmpty);

  @override
  String toString() {
    final buffer = StringBuffer();

    for (var r = 0; r < size; r++) {
      for (var c = 0; c < size; c++) {
        final cell = getAt(Position(row: r, col: c));
        switch (cell) {
          case CellState.empty:
            buffer.write('.');
          case CellState.p1:
            buffer.write('X');
          case CellState.p2:
            buffer.write('O');
        }
        if (c < size - 1) buffer.write(' ');
      }
      if (r < size - 1) buffer.write('\n');
    }
    return buffer.toString();
  }
}
