import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/features/game/domain/entities/board.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';
import 'package:tictactoe/features/game/domain/logic/game_rules.dart';

void main() {
  group('Board', () {
    group('empty', () {
      test('creates a 3x3 empty board by default', () {
        final board = Board.empty();

        expect(board.size, 3);
        expect(board.isEmpty, true);
        expect(board.isFull, false);
      });

      test('creates an empty board with custom size', () {
        final board = Board.empty(size: 4);

        expect(board.size, 4);
        expect(board.isEmpty, true);
      });
    });

    group('with cells', () {
      test('creates board from list of cells', () {
        final cells = [
          CellState.p1,
          CellState.empty,
          CellState.empty,
          CellState.empty,
          CellState.p2,
          CellState.empty,
          CellState.empty,
          CellState.empty,
          CellState.empty,
        ];
        final board = Board(size: 3, cells: cells);

        expect(board.getAt(const Position(row: 0, col: 0)), CellState.p1);
        expect(board.getAt(const Position(row: 1, col: 1)), CellState.p2);
      });
    });

    group('getAt/setAt', () {
      test('gets cell state at position', () {
        final board = Board.empty();

        expect(board.getAt(const Position(row: 0, col: 0)), CellState.empty);
        expect(board.getAt(const Position(row: 2, col: 2)), CellState.empty);
      });

      test('sets cell state at position (immutably)', () {
        final board = Board.empty();
        final newBoard = board.setAt(
          const Position(row: 1, col: 1),
          CellState.p1,
        );

        expect(board.getAt(const Position(row: 1, col: 1)), CellState.empty);
        expect(newBoard.getAt(const Position(row: 1, col: 1)), CellState.p1);
      });

      test('throws error for out of bounds position', () {
        final board = Board.empty();

        expect(
          () => board.getAt(const Position(row: 3, col: 3)),
          throwsArgumentError,
        );
      });
    });

    group('positions', () {
      test('returns all positions on the board', () {
        final board = Board.empty();
        final positions = board.positions.toList();

        expect(positions.length, 9);
        expect(positions.first, const Position(row: 0, col: 0));
        expect(positions.last, const Position(row: 2, col: 2));
      });
    });

    group('availablePositions (via GameRules)', () {
      test('returns all positions when board is empty', () {
        final board = Board.empty();

        expect(GameRules.getAvailablePositions(board).length, 9);
      });

      test('returns only empty positions', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 0), CellState.p1)
            .setAt(const Position(row: 1, col: 1), CellState.p2)
            .setAt(const Position(row: 2, col: 2), CellState.p1);

        expect(GameRules.getAvailablePositions(board).length, 6);
        expect(
          GameRules.getAvailablePositions(
            board,
          ).contains(const Position(row: 0, col: 0)),
          false,
        );
      });

      test('returns empty list when board is full', () {
        var board = Board.empty();
        for (final pos in board.positions) {
          board = board.setAt(pos, CellState.p1);
        }

        expect(GameRules.getAvailablePositions(board), isEmpty);
        expect(board.isFull, true);
      });
    });

    group('isFull/isEmpty', () {
      test('isEmpty returns true for empty board', () {
        final board = Board.empty();

        expect(board.isEmpty, true);
      });

      test('isFull returns true when all cells are occupied', () {
        var board = Board.empty();
        for (final pos in board.positions) {
          board = board.setAt(pos, CellState.p1);
        }

        expect(board.isFull, true);
        expect(board.isEmpty, false);
      });
    });

    group('GameRules - line helpers', () {
      test('getAllLines includes rows, columns, and diagonals', () {
        final lines = GameRules.getAllLines(3);

        expect(lines.length, 8);
      });

      test('getAllLines for row 0', () {
        final lines = GameRules.getAllLines(3);
        final row0 = lines[0];

        expect(row0, [
          const Position(row: 0, col: 0),
          const Position(row: 0, col: 1),
          const Position(row: 0, col: 2),
        ]);
      });

      test('getAllLines for column 1', () {
        final lines = GameRules.getAllLines(3);
        final col1 = lines[4];

        expect(col1, [
          const Position(row: 0, col: 1),
          const Position(row: 1, col: 1),
          const Position(row: 2, col: 1),
        ]);
      });

      test('getAllLines includes primary diagonal', () {
        final lines = GameRules.getAllLines(3);
        final diag = lines[6];

        expect(diag, [
          const Position(row: 0, col: 0),
          const Position(row: 1, col: 1),
          const Position(row: 2, col: 2),
        ]);
      });

      test('getAllLines includes secondary diagonal', () {
        final lines = GameRules.getAllLines(3);
        final diag = lines[7];

        expect(diag, [
          const Position(row: 0, col: 2),
          const Position(row: 1, col: 1),
          const Position(row: 2, col: 0),
        ]);
      });
    });

    group('GameRules - checkLine', () {
      test('returns null for empty line', () {
        final board = Board.empty();
        final line = [
          const Position(row: 0, col: 0),
          const Position(row: 0, col: 1),
          const Position(row: 0, col: 2),
        ];

        expect(GameRules.checkLine(board, line), null);
      });

      test('returns null for mixed line', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 0), CellState.p1)
            .setAt(const Position(row: 0, col: 1), CellState.p2)
            .setAt(const Position(row: 0, col: 2), CellState.p1);
        final line = [
          const Position(row: 0, col: 0),
          const Position(row: 0, col: 1),
          const Position(row: 0, col: 2),
        ];

        expect(GameRules.checkLine(board, line), null);
      });

      test('returns cell state for winning line', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 0), CellState.p1)
            .setAt(const Position(row: 0, col: 1), CellState.p1)
            .setAt(const Position(row: 0, col: 2), CellState.p1);
        final line = [
          const Position(row: 0, col: 0),
          const Position(row: 0, col: 1),
          const Position(row: 0, col: 2),
        ];

        expect(GameRules.checkLine(board, line), CellState.p1);
      });
    });

    group('GameRules - findWinningLine', () {
      test('returns null when no winner', () {
        final board = Board.empty();

        expect(GameRules.findWinningLine(board), null);
      });

      test('detects horizontal win', () {
        final board = Board.empty()
            .setAt(const Position(row: 1, col: 0), CellState.p2)
            .setAt(const Position(row: 1, col: 1), CellState.p2)
            .setAt(const Position(row: 1, col: 2), CellState.p2);

        final winningLine = GameRules.findWinningLine(board);
        expect(winningLine, isNotNull);
        expect(winningLine, [
          const Position(row: 1, col: 0),
          const Position(row: 1, col: 1),
          const Position(row: 1, col: 2),
        ]);
      });

      test('detects vertical win', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 2), CellState.p1)
            .setAt(const Position(row: 1, col: 2), CellState.p1)
            .setAt(const Position(row: 2, col: 2), CellState.p1);

        final winningLine = GameRules.findWinningLine(board);
        expect(winningLine, isNotNull);
        expect(winningLine, [
          const Position(row: 0, col: 2),
          const Position(row: 1, col: 2),
          const Position(row: 2, col: 2),
        ]);
      });

      test('detects primary diagonal win', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 0), CellState.p2)
            .setAt(const Position(row: 1, col: 1), CellState.p2)
            .setAt(const Position(row: 2, col: 2), CellState.p2);

        final winningLine = GameRules.findWinningLine(board);
        expect(winningLine, isNotNull);
        expect(winningLine, [
          const Position(row: 0, col: 0),
          const Position(row: 1, col: 1),
          const Position(row: 2, col: 2),
        ]);
      });

      test('detects secondary diagonal win', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 2), CellState.p1)
            .setAt(const Position(row: 1, col: 1), CellState.p1)
            .setAt(const Position(row: 2, col: 0), CellState.p1);

        final winningLine = GameRules.findWinningLine(board);
        expect(winningLine, isNotNull);
        expect(winningLine, [
          const Position(row: 0, col: 2),
          const Position(row: 1, col: 1),
          const Position(row: 2, col: 0),
        ]);
      });
    });

    group('equality', () {
      test('two empty boards are equal', () {
        final board1 = Board.empty();
        final board2 = Board.empty();

        expect(board1, board2);
      });

      test('boards with same cells are equal', () {
        final board1 = Board.empty().setAt(
          const Position(row: 0, col: 0),
          CellState.p1,
        );
        final board2 = Board.empty().setAt(
          const Position(row: 0, col: 0),
          CellState.p1,
        );

        expect(board1, board2);
      });

      test('boards with different cells are not equal', () {
        final board1 = Board.empty().setAt(
          const Position(row: 0, col: 0),
          CellState.p1,
        );
        final board2 = Board.empty().setAt(
          const Position(row: 0, col: 0),
          CellState.p2,
        );

        expect(board1, isNot(board2));
      });
    });

    group('toString', () {
      test('displays empty board correctly', () {
        final board = Board.empty();
        final string = board.toString();

        expect(string, '. . .\n. . .\n. . .');
      });

      test('displays board with moves correctly', () {
        final board = Board.empty()
            .setAt(const Position(row: 0, col: 0), CellState.p1)
            .setAt(const Position(row: 1, col: 1), CellState.p2)
            .setAt(const Position(row: 2, col: 2), CellState.p1);
        final string = board.toString();

        expect(string, 'X . .\n. O .\n. . X');
      });
    });
  });
}
