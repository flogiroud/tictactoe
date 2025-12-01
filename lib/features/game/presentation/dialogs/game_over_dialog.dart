import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/localizations_extension.dart';
import 'package:tictactoe/core/providers/audio_service_provider.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/ui/widgets/animations/appear_animation.dart';
import 'package:tictactoe/core/ui/widgets/animations/rotation_animation.dart';
import 'package:tictactoe/core/ui/widgets/animations/scale_animation.dart';
import 'package:tictactoe/core/ui/widgets/animations/translate_animation.dart';
import 'package:tictactoe/core/ui/widgets/basic_icon.dart';
import 'package:tictactoe/core/ui/widgets/bordered_text.dart';
import 'package:tictactoe/core/ui/widgets/custom_button.dart';
import 'package:tictactoe/core/utils/haptic_feedbacks_utils.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/presentation/extensions/player_extension.dart';

enum GameOverAction { playAgain, goToHome }

abstract class GameOverDialog {
  static Future<GameOverAction?> show({
    required BuildContext context,
    required GameStatus status,
    required GameMode mode,
  }) async => showGeneralDialog<GameOverAction>(
    barrierColor: Colors.black.withValues(alpha: .8),
    context: context,
    barrierDismissible: false,
    pageBuilder: (context, animation, secondaryAnimation) =>
        _GameOverDialogContent(status: status, mode: mode),
  );
}

class _GameOverDialogContent extends HookConsumerWidget {
  final GameStatus status;
  final GameMode mode;

  const _GameOverDialogContent({required this.status, required this.mode});

  Player? get playerWinner => status.map(
    playing: (_) => null,
    won: (won) => won.winner,
    draw: (_) => null,
  );
  bool get isPlayer1Won => playerWinner == Player.p1;
  bool get isPlayer2Won => playerWinner == Player.p2;
  bool get isDraw =>
      status.map(playing: (_) => false, won: (won) => false, draw: (_) => true);
  bool get isAiWon => mode.isAi && isPlayer2Won;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = isPlayer1Won
        ? context.loc.playerWins('1')
        : isPlayer2Won
        ? context.loc.playerWins('2')
        : context.loc.gameDraw;

    useEffect(() {
      ref
          .read(audioServiceProvider)
          .play(isAiWon || isDraw ? AppSound.lose : AppSound.success);
      HapticFeedbackUtils.gameOver();
      return null;
    }, []);

    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _PositionedHeader(isAiWon: isAiWon),
          Positioned.fill(
            left: 16,
            right: 16,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (playerWinner != null && !isAiWon)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ScaleAnimation(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned.fill(
                              top: -300,
                              left: -300,
                              right: -300,
                              bottom: -300,
                              child: RotationAnimation(
                                child: Image.asset(
                                  AppImagesAssets.full_shine_faded,
                                ),
                              ),
                            ),
                            BasicIcon(playerWinner!.icon, size: 100),
                          ],
                        ),
                      ),
                    ),
                  FittedBox(
                    child: ScaleAnimation(
                      delay: const Duration(milliseconds: 250),
                      child: BorderedText(
                        text: message.toUpperCase(),
                        style: Theme.of(context).textTheme.displayLarge
                            ?.copyWith(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 32,
            left: 16,
            right: 16,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16,
                children: [
                  const _Action(
                    action: GameOverAction.playAgain,
                    delay: Duration(milliseconds: 450),
                  ),
                  _Action(
                    action: GameOverAction.goToHome,
                    delay: const Duration(milliseconds: 550),
                    color: context.appColors.secondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PositionedHeader extends StatelessWidget {
  final bool isAiWon;

  const _PositionedHeader({required this.isAiWon});

  Duration get _animationDuration => const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    final bannerColor = isAiWon
        ? context.appColors.red
        : context.appColors.primary;

    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: TranslateAnimation(
              curve: Spring.elegant,
              duration: _animationDuration,

              beginOffset: Offset(
                -MediaQuery.of(context).size.width * .75,
                -200,
              ),
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width * .75,
                  MediaQuery.of(context).size.width * .3,
                ),
                painter: _TopLeftShapeCustomPainter(color: bannerColor),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: TranslateAnimation(
              curve: Spring.elegant,
              duration: _animationDuration,
              delay: const Duration(milliseconds: 200),
              beginOffset: Offset(MediaQuery.of(context).size.width * .6, 0),
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width * .6,
                  MediaQuery.of(context).size.width * .2,
                ),
                painter: _TopRightShapeCustomPainter(color: bannerColor),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * .25,
            left: 0,
            child: TranslateAnimation(
              curve: Spring.elegant,
              duration: _animationDuration,
              delay: const Duration(milliseconds: 350),
              beginOffset: Offset(-MediaQuery.of(context).size.width * .2, 30),
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width * .2,
                  MediaQuery.of(context).size.width * .22,
                ),
                painter: _TopLeftSmallShapeCustomPainter(color: bannerColor),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 32,
            left: 32,
            right: 32,
            child: AppearAnimation(
              duration: _animationDuration,
              delay: const Duration(milliseconds: 350),
              child: BorderedText(
                text: context.loc.gameOver.toUpperCase(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final GameOverAction action;
  final Duration delay;
  final Color? color;

  const _Action({required this.action, required this.delay, this.color});

  @override
  Widget build(BuildContext context) {
    return TranslateAnimation(
      delay: delay,
      beginOffset: Offset(0, MediaQuery.of(context).padding.bottom + 200),
      child: CustomButton(
        color: color,
        text: action == GameOverAction.playAgain
            ? context.loc.playAgain
            : context.loc.goToHome,
        onTap: () => Navigator.of(context).pop(action),
      ),
    );
  }
}

class _TopLeftShapeCustomPainter extends CustomPainter {
  final Color color;

  _TopLeftShapeCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9908298);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.9976875, size.height * 0.00001948155);
    path_0.lineTo(size.width * 0.4045362, size.height * 0.6385393);
    path_0.lineTo(size.width * 0.4065987, size.height * 0.5770488);
    path_0.lineTo(0, size.height * 0.9908298);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TopRightShapeCustomPainter extends CustomPainter {
  final Color color;

  _TopRightShapeCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.9974683);
    path_0.lineTo(size.width * 0.7619657, 0);
    path_0.lineTo(size.width * 0.9980558, 0);
    path_0.lineTo(0, size.height * 0.9974683);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TopLeftSmallShapeCustomPainter extends CustomPainter {
  final Color color;

  _TopLeftSmallShapeCustomPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9984500, 0);
    path_0.lineTo(size.width * 0.00004338136, size.height * 0.3999317);
    path_0.lineTo(0, size.height * 0.8815717);
    path_0.lineTo(size.width * 0.9984500, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
