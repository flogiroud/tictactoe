import 'package:tictactoe/features/game/domain/entities/board.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';

class GameRules {
  GameRules._();

  // NOTE: Returns all possible winning lines for a board size
  static List<List<Position>> getAllLines(int size) {
    return [
      ...List.generate(size, (r) => _rowPositions(r, size)), // NOTE: Rows
      ...List.generate(size, (c) => _colPositions(c, size)), // NOTE: Columns
      _diagonalsPrimary(size), // NOTE: Diagonals
      _diagonalsSecondary(size), // NOTE: Diagonals
    ];
  }

  // NOTE: Checks if all positions in a line have the same non empty cell state + Returns the cell state if there's a match, null otherwise
  static CellState? checkLine(Board board, List<Position> line) {
    if (line.isEmpty) return null;

    final first = board.getAt(line.first);
    if (first.isEmpty) return null;

    for (final pos in line.skip(1)) {
      if (board.getAt(pos) != first) return null;
    }

    return first;
  }

  // NOTE: Finds the winning line on the board if there is one
  static List<Position>? findWinningLine(Board board) {
    for (final line in getAllLines(board.size)) {
      if (checkLine(board, line) != null) {
        return line;
      }
    }
    return null;
  }

  // NOTE: Returns all available empty positions on the board
  static List<Position> getAvailablePositions(Board board) {
    return board.positions.where((pos) => board.getAt(pos).isEmpty).toList();
  }

  // NOTE: Returns true if the board has a winner
  static bool hasWinner(Board board) => findWinningLine(board) != null;

  // NOTE: Returns true if the game is a draw
  static bool isDraw(Board board) => board.isFull && !hasWinner(board);

  // SECTION: Helpers
  // NOTE: Returns positions for a specific row
  static List<Position> _rowPositions(int r, int size) =>
      List.generate(size, (c) => Position(row: r, col: c));

  // NOTE: Returns positions for a specific column
  static List<Position> _colPositions(int c, int size) =>
      List.generate(size, (r) => Position(row: r, col: c));

  // NOTE: Returns positions for the primary diagonal (top-left/bottom-right)
  static List<Position> _diagonalsPrimary(int size) =>
      List.generate(size, (i) => Position(row: i, col: i));

  // NOTE: Returns positions for the secondary diagonal (top-right/bottom-left)
  static List<Position> _diagonalsSecondary(int size) =>
      List.generate(size, (i) => Position(row: i, col: size - 1 - i));
  // !SECTION
}
