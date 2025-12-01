import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/utils/logger.dart';
import 'package:tictactoe/features/game/domain/entities/ai_difficulty.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';
import 'package:tictactoe/features/game/domain/logic/ai_player/ai_player.dart';
import 'package:tictactoe/features/game/domain/logic/ai_player/impl/minimax_ai_player.dart';
import 'package:tictactoe/features/game/domain/logic/ai_player/impl/random_ai_player.dart';
import 'package:tictactoe/features/game/domain/logic/game_rules.dart';
import 'package:tictactoe/features/game/domain/usecases/delete_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/load_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/save_game_usecase.dart';
import 'package:tictactoe/features/game/presentation/providers/current_game_mode_provider.dart';
import 'package:tictactoe/features/game/presentation/providers/states/game_state.dart';

part 'game_notifier.g.dart';

@Riverpod(dependencies: [currentGameMode])
class GameNotifier extends _$GameNotifier {
  late final SaveGameUseCase _saveGameUseCase;
  late final DeleteSavedGameUseCase _deleteSavedGameUseCase;
  late final LoadSavedGameUseCase _loadSavedGameUseCase;
  late final AiPlayer _aiPlayer;

  @override
  GameState build() {
    _saveGameUseCase = ref.read(saveGameUseCaseProvider);
    _deleteSavedGameUseCase = ref.read(deleteSavedGameUseCaseProvider);
    _loadSavedGameUseCase = ref.read(loadSavedGameUseCaseProvider);

    final mode = ref.watch(currentGameModeProvider);
    AiPlayer? aiPlayer;

    mode?.mapOrNull(
      ai: (aiMode) {
        aiPlayer = aiMode.difficulty == const AiDifficulty.easy()
            ? const RandomAiPlayer()
            : const MinimaxAiPlayer();
      },
    );
    _aiPlayer = aiPlayer ?? const RandomAiPlayer();

    return GameState(game: Game.initial(mode: mode ?? const GameMode.local()));
  }

  bool get _shouldAiPlay =>
      state.game.mode.isAi &&
      state.game.currentPlayer == Player.p2 &&
      !state.game.isGameOver;

  Future<void> tryLoadSavedGame() async {
    state = state.copyWith(isLoading: true);

    final result = await _loadSavedGameUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false);
      },
      (savedGame) {
        if (savedGame != null && savedGame.mode == state.game.mode) {
          state = state.copyWith(game: savedGame, isLoading: false);
        } else {
          state = state.copyWith(isLoading: false);
        }
      },
    );
  }

  void playMove(Position pos) async {
    if (state.game.isGameOver || !state.game.board.getAt(pos).isEmpty) return;
    _applyMove(pos);
    if (_shouldAiPlay) {
      await _playAiMove();
    }
  }

  void _applyMove(Position pos) {
    final game = state.game;
    final newBoard = game.board.setAt(
      pos,
      CellState.fromPlayer(game.currentPlayer),
    );
    final winningLine = GameRules.findWinningLine(newBoard);

    if (winningLine != null) {
      final updatedGame = game.copyWith(
        board: newBoard,
        status: GameStatus.won(game.currentPlayer),
        winningLine: winningLine,
        moveCount: game.moveCount + 1,
      );

      state = state.copyWith(game: updatedGame);
      deleteSavedGame();
    } else if (newBoard.isFull) {
      final updatedGame = game.copyWith(
        board: newBoard,
        status: const GameStatus.draw(),
        moveCount: game.moveCount + 1,
      );

      state = state.copyWith(game: updatedGame);
      deleteSavedGame();
    } else {
      final updatedGame = game.copyWith(
        board: newBoard,
        currentPlayer: game.currentPlayer.opponent,
        moveCount: game.moveCount + 1,
      );

      state = state.copyWith(game: updatedGame);
      _saveGame();
    }
  }

  Future<void> _playAiMove() async {
    // NOTE: Random delay for realistic play move
    final randomDelay = Random().nextInt(500) + 500;
    await Future.delayed(Duration(milliseconds: randomDelay));

    try {
      final aiMove = _aiPlayer.calculateMove(state.game.board, Player.p2);

      _applyMove(aiMove);
    } catch (e, stackTrace) {
      logger.e('AI failed to calculate move', error: e, stackTrace: stackTrace);
    }
  }

  void reset() async {
    state = GameState(game: Game.initial(mode: state.game.mode));
    await _saveGame();
  }

  Future<void> deleteSavedGame() async {
    await _deleteSavedGameUseCase();
  }

  Future<void> _saveGame() async {
    await _saveGameUseCase(state.game);
  }
}
