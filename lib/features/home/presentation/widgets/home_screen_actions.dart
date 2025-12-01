import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/localizations_extension.dart';
import 'package:tictactoe/core/router/router_provider.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/ui/widgets/animations/scale_animation.dart';
import 'package:tictactoe/core/ui/widgets/custom_button.dart';
import 'package:tictactoe/core/ui/widgets/custom_dialog.dart';
import 'package:tictactoe/features/game/domain/entities/ai_difficulty.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/presentation/extensions/ai_difficulty_extension.dart';
import 'package:tictactoe/features/home/presentation/providers/home_notifier.dart';

class HomeScreenActions extends HookConsumerWidget {
  const HomeScreenActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScaleAnimation(
          delay: const Duration(milliseconds: 600),
          child: CustomButton(
            textUppercase: false,
            color: context.appColors.secondary,
            isDisabled: homeState.isLoading,
            onTap: () => _navigateToGame(context, ref, const GameMode.local()),
            icon: AppImagesAssets.duo,
            text: context.loc.gameModeLocal,
            sound: AppSound.open,
          ),
        ),
        const SizedBox(height: 16),
        ScaleAnimation(
          delay: const Duration(milliseconds: 800),
          child: CustomButton(
            textUppercase: false,
            color: context.appColors.primary,
            isDisabled: homeState.isLoading,
            onTap: () => _showDifficultyDialog(context, ref),
            text: context.loc.gameModeAi,
            icon: AppImagesAssets.solo,
          ),
        ),
      ],
    );
  }

  Future<void> _showDifficultyDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final l10n = context.loc;

    final difficulty = await CustomDialog.show<AiDifficulty>(
      context: context,
      title: context.loc.solo,
      titleIcon: AppImagesAssets.solo,
      description: context.loc.selectDifficulty,
      actions: [
        CustomButton(
          text: const AiDifficulty.easy().displayName(l10n),
          color: context.appColors.green,
          onTap: () => Navigator.of(context).pop(const AiDifficulty.easy()),
          sound: AppSound.open,
        ),
        CustomButton(
          text: const AiDifficulty.hard().displayName(l10n),
          color: context.appColors.purple,
          onTap: () => Navigator.of(context).pop(const AiDifficulty.hard()),
          sound: AppSound.open,
        ),
      ],
    );

    if (!context.mounted || difficulty == null) return;

    _navigateToGame(context, ref, GameMode.ai(difficulty: difficulty));
  }

  void _navigateToGame(BuildContext context, WidgetRef ref, GameMode mode) {
    final router = ref.read(routerProvider);
    final currentLocation = router.routerDelegate.currentConfiguration.uri.path;

    if (!currentLocation.startsWith(Routes.game)) {
      context.push('${Routes.game}/${mode.toPath()}');
    }
  }
}
