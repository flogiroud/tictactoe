// ignore_for_file: provider_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/color_extension.dart';
import 'package:tictactoe/core/extensions/localizations_extension.dart';
import 'package:tictactoe/core/ui/widgets/basic_icon.dart';
import 'package:tictactoe/core/ui/widgets/bordered_text.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/presentation/extensions/player_extension.dart';
import 'package:tictactoe/features/game/presentation/providers/game_notifier.dart';

class GameScreenHeader extends HookConsumerWidget {
  const GameScreenHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameProvider);

    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _FlexiblePlayerTurn(
            player: Player.p1,
            currentPlayer: gameState.game.currentPlayer,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FittedBox(
              child: Text(
                context.loc.vs,
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _FlexiblePlayerTurn(
            player: Player.p2,
            currentPlayer: gameState.game.currentPlayer,
          ),
        ],
      ),
    );
  }
}

class _FlexiblePlayerTurn extends StatelessWidget {
  final Player player;
  final Player currentPlayer;

  const _FlexiblePlayerTurn({
    required this.player,
    required this.currentPlayer,
  });

  bool get isCurrentPlayer => player == currentPlayer;
  bool get isPlayer1 => player == Player.p1;

  @override
  Widget build(BuildContext context) {
    final color = isCurrentPlayer
        ? player.color(context)
        : context.appColors.disabled;

    return Flexible(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Spring.elegant,
        height: 32,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.darken,
          border: Border.all(
            color: context.appColors.border,
            width: context.appValues.borderWidth,
          ),
          borderRadius: BorderRadius.circular(context.appValues.borderRadius),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: isPlayer1 ? Alignment.centerLeft : Alignment.centerRight,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 10,
                decoration: BoxDecoration(color: color),
              ),
            ),
            Padding(
              padding: isPlayer1
                  ? const EdgeInsets.only(left: 32, right: 8)
                  : const EdgeInsets.only(left: 8, right: 32),
              child: FittedBox(
                child: BorderedText(
                  text:
                      (isPlayer1
                              ? context.loc.playerTurn(1)
                              : context.loc.playerTurn(2))
                          .toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              curve: Spring.elegant,
              top: isCurrentPlayer ? -14 : -8,
              bottom: isCurrentPlayer ? 2 : 4,
              left: isPlayer1 ? -16 : null,
              right: isPlayer1 ? null : -16,
              child: BasicIcon(player.icon, size: 40),
            ),
          ],
        ),
      ),
    );
  }
}
