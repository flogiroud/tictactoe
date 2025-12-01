// ignore_for_file: provider_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/ui/widgets/custom_scaffold.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/presentation/dialogs/game_over_dialog.dart';
import 'package:tictactoe/features/game/presentation/providers/current_game_mode_provider.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_screen_board.dart';
import 'package:tictactoe/features/game/presentation/widgets/game_screen_header.dart';

class GameScreen extends StatelessWidget {
  final GameMode mode;
  final bool shouldResume;

  const GameScreen({super.key, required this.mode, this.shouldResume = false});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [currentGameModeProvider.overrideWithValue(mode)],
      child: _GameScreenContent(shouldResume: shouldResume),
    );
  }
}

class _GameScreenContent extends HookConsumerWidget {
  final bool shouldResume;

  const _GameScreenContent({this.shouldResume = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);
    final mode = ref.watch(currentGameModeProvider)!;

    useEffect(() {
      if (shouldResume) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await gameNotifier.tryLoadSavedGame();
        });
      }
      return null;
    }, []);

    useEffect(() {
      if (gameState.game.isGameOver) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showGameOverDialog(
            context,
            gameState.game.status,
            gameNotifier,
            mode,
          );
        });
      }
      return null;
    }, [gameState.game.status]);

    return CustomScaffold(
      isLoading: gameState.isLoading,
      onBack: (context) {
        gameNotifier.deleteSavedGame();
        context.pop();
      },
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 72, 16, 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [GameScreenHeader(), GameScreenBoard()],
        ),
      ),
    );
  }

  Future<void> _showGameOverDialog(
    BuildContext context,
    GameStatus status,
    GameNotifier gameNotifier,
    GameMode mode,
  ) async {
    final action = await GameOverDialog.show(
      context: context,
      status: status,
      mode: mode,
    );

    if (action == GameOverAction.playAgain) {
      gameNotifier.reset();
    } else if (action == GameOverAction.goToHome && context.mounted) {
      context.pop();
    }
  }
}
