// ignore_for_file: provider_dependencies
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/color_extension.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/ui/widgets/animations/scale_animation.dart';
import 'package:tictactoe/core/ui/widgets/animations/translate_animation.dart';
import 'package:tictactoe/core/ui/widgets/basic_icon.dart';
import 'package:tictactoe/core/ui/widgets/custom_gesture_detector.dart';
import 'package:tictactoe/features/game/domain/entities/cell_state.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';
import 'package:tictactoe/features/game/presentation/extensions/player_extension.dart';
import 'package:tictactoe/features/game/presentation/providers/current_game_mode_provider.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class GameScreenBoard extends HookConsumerWidget {
  const GameScreenBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);
    final gameNotifier = ref.read(gameProvider.notifier);
    final mode = ref.watch(currentGameModeProvider)!;

    return Expanded(
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gameState.game.board.size,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: gameState.game.board.size * gameState.game.board.size,
          itemBuilder: (context, index) {
            final pos = gameState.game.board.posFromIndex(index);
            final cell = gameState.game.board.getAt(pos);
            final isWinning = gameState.game.winningLine.contains(pos);
            final cellIndex = gameState.game.board.index(pos);
            final isAiThinking =
                mode.isAi &&
                gameState.game.currentPlayer == Player.p2 &&
                !gameState.game.isGameOver;

            return _Cell(
              cell: cell,
              isWinning: isWinning,
              onTap: () => gameNotifier.playMove(pos),
              isAiThinking: isAiThinking,
              index: cellIndex,
              position: pos,
              boardSize: gameState.game.board.size,
            );
          },
        ),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final CellState cell;
  final bool isWinning;
  final VoidCallback? onTap;
  final bool isAiThinking;
  final int index;
  final Position position;
  final int boardSize;

  const _Cell({
    required this.cell,
    required this.isWinning,
    required this.onTap,
    required this.isAiThinking,
    required this.index,
    required this.position,
    required this.boardSize,
  });

  bool get _showIcon => cell != CellState.empty && cell.toPlayer != null;

  bool get _isCenterCell {
    final center = boardSize ~/ 2;

    return position.row == center && position.col == center;
  }

  Offset get _beginOffset {
    const offset = 150.0;
    final relativeRow = (position.row - (boardSize - 1) / 2) / (boardSize - 1);
    final relativeCol = (position.col - (boardSize - 1) / 2) / (boardSize - 1);

    return Offset(relativeCol * offset, relativeRow * offset);
  }

  @override
  Widget build(BuildContext context) {
    final color = isWinning
        ? context.appColors.green
        : _showIcon
        ? cell.toPlayer!.color(context).lighten
        : context.appColors.primaryLight;

    return TranslateAnimation(
      disabled: _isCenterCell,
      control: Control.play,
      duration: const Duration(milliseconds: 750),
      beginOffset: _beginOffset,
      child: ScaleAnimation(
        disabled: !_isCenterCell,
        control: Control.play,
        duration: const Duration(milliseconds: 750),
        child: CustomGestureDetector(
          isDisabled: isAiThinking || cell != CellState.empty,
          sound: AppSound.cell,
          onTap: onTap,
          mode: CustomGestureDetectorMode.scale,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                context.appValues.borderRadius,
              ),
              border: Border.all(
                color: context.appColors.border,
                width: context.appValues.borderWidth,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.appColors.border.withValues(alpha: .5),
                  blurRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(color: color.darken),
                  ),
                ),
                if (_showIcon) _CellIcon(icon: cell.toPlayer!.icon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CellIcon extends StatelessWidget {
  final String icon;

  const _CellIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomAnimationBuilder<Movie>(
        control: Control.play,
        tween: MovieTween()
          ..scene(
                duration: const Duration(milliseconds: 750),
                curve: Spring.stern,
              )
              .tween('scale', Tween<double>(begin: 0, end: 1))
              .tween('rotate', Tween<double>(begin: math.pi / 2.75, end: 0)),
        duration: const Duration(milliseconds: 750),
        builder: (_, value, child) => Transform.rotate(
          angle: value.get('rotate'),
          child: Transform.scale(scale: value.get('scale'), child: child),
        ),
        child: BasicIcon(icon, size: 72),
      ),
    );
  }
}
