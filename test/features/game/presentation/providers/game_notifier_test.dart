// ignore_for_file: provider_dependencies
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';
import 'package:tictactoe/features/game/presentation/providers/current_game_mode_provider.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  group('GameNotifier', () {
    late ProviderContainer container;
    late GameNotifier notifier;
    const mode = GameMode.local();

    setUp(() async {
      container = await createTestContainer(
        additionalOverrides: [
          currentGameModeProvider.overrideWith((ref) => mode),
        ],
      );
      notifier = container.read(gameProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is a new game', () {
      final gameState = container.read(gameProvider);

      expect(gameState.game.board.isEmpty, true);
      expect(gameState.game.currentPlayer, Player.p1);
      expect(gameState.game.status, const GameStatus.playing());
      expect(gameState.game.moveCount, 0);
    });

    group('playMove', () {
      test('places mark on empty cell', () {
        notifier.playMove(const Position(row: 0, col: 0));

        final gameState = container.read(gameProvider);

        expect(
          gameState.game.board.getAt(const Position(row: 0, col: 0)),
          CellState.p1,
        );
        expect(gameState.game.currentPlayer, Player.p2);
        expect(gameState.game.moveCount, 1);
      });

      test('ignores move on occupied cell', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 0, col: 0));

        final gameState = container.read(gameProvider);

        expect(
          gameState.game.board.getAt(const Position(row: 0, col: 0)),
          CellState.p1,
        );
        expect(gameState.game.currentPlayer, Player.p2);
        expect(gameState.game.moveCount, 1);
      });

      test('alternates between players', () {
        notifier.playMove(const Position(row: 0, col: 0));
        expect(container.read(gameProvider).game.currentPlayer, Player.p2);

        notifier.playMove(const Position(row: 0, col: 1));
        expect(container.read(gameProvider).game.currentPlayer, Player.p1);

        notifier.playMove(const Position(row: 0, col: 2));
        expect(container.read(gameProvider).game.currentPlayer, Player.p2);
      });

      test('detects horizontal win', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 1, col: 0));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 0, col: 2));

        final gameState = container.read(gameProvider);

        expect(gameState.game.status, const GameStatus.won(Player.p1));
        expect(gameState.game.winningLine.length, 3);
        expect(gameState.game.moveCount, 5);
      });

      test('detects vertical win', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 0, col: 2));
        notifier.playMove(const Position(row: 1, col: 0));
        notifier.playMove(const Position(row: 1, col: 2));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 2, col: 2));

        final gameState = container.read(gameProvider);

        expect(gameState.game.status, const GameStatus.won(Player.p2));
        expect(gameState.game.winningLine.length, 3);
      });

      test('detects diagonal win', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 0, col: 2));
        notifier.playMove(const Position(row: 2, col: 2));

        final gameState = container.read(gameProvider);

        expect(gameState.game.status, const GameStatus.won(Player.p1));
        expect(gameState.game.winningLine.length, 3);
      });

      test('detects draw', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 0, col: 2));
        notifier.playMove(const Position(row: 1, col: 0));
        notifier.playMove(const Position(row: 1, col: 2));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 2, col: 0));
        notifier.playMove(const Position(row: 2, col: 2));
        notifier.playMove(const Position(row: 2, col: 1));

        final gameState = container.read(gameProvider);

        expect(gameState.game.status, const GameStatus.draw());
        expect(gameState.game.board.isFull, true);
        expect(gameState.game.moveCount, 9);
      });

      test('ignores moves after game is won', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 1, col: 0));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 0, col: 2));

        final gameStateBefore = container.read(gameProvider);

        notifier.playMove(const Position(row: 2, col: 0));
        notifier.playMove(const Position(row: 2, col: 1));

        final gameStateAfter = container.read(gameProvider);

        expect(gameStateAfter, gameStateBefore);
        expect(gameStateAfter.game.moveCount, 5);
      });
    });

    group('reset', () {
      test('resets game to initial state', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 2, col: 2));

        notifier.reset();

        final gameState = container.read(gameProvider);

        expect(gameState.game.board.isEmpty, true);
        expect(gameState.game.currentPlayer, Player.p1);
        expect(gameState.game.status, const GameStatus.playing());
        expect(gameState.game.moveCount, 0);
      });

      test('resets after game is won', () {
        notifier.playMove(const Position(row: 0, col: 0));
        notifier.playMove(const Position(row: 1, col: 0));
        notifier.playMove(const Position(row: 0, col: 1));
        notifier.playMove(const Position(row: 1, col: 1));
        notifier.playMove(const Position(row: 0, col: 2));

        expect(
          container.read(gameProvider).game.status,
          const GameStatus.won(Player.p1),
        );

        notifier.reset();

        final gameState = container.read(gameProvider);

        expect(gameState.game.board.isEmpty, true);
        expect(gameState.game.status, const GameStatus.playing());
      });
    });
  });
}
