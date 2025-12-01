import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/localizations_extension.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/ui/widgets/custom_button.dart';
import 'package:tictactoe/core/ui/widgets/custom_dialog.dart';
import 'package:tictactoe/core/ui/widgets/custom_scaffold.dart';
import 'package:tictactoe/features/home/presentation/providers/home_notifier.dart';
import 'package:tictactoe/features/home/presentation/providers/states/home_state.dart';
import 'package:tictactoe/features/home/presentation/widgets/home_screen_actions.dart';
import 'package:tictactoe/features/home/presentation/widgets/home_screen_app_icon.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(homeProvider.notifier).checkForSavedGame();
      });
      return null;
    }, []);
    useEffect(() {
      if (homeState.pendingAction == HomeAction.promptForSavedGame) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showResumeGameDialog(context, ref);
        });
      }
      return null;
    }, [homeState.pendingAction]);

    return CustomScaffold(
      isLoading: homeState.isLoading,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeScreenAppIcon(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const HomeScreenActions(),
          ],
        ),
      ),
    );
  }

  Future<void> _showResumeGameDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final homeNotifier = ref.read(homeProvider.notifier);
    final savedGame = ref.read(homeProvider).savedGame;

    if (savedGame == null) {
      homeNotifier.clearPendingAction();
      return;
    }

    final shouldResume = await CustomDialog.show<bool>(
      context: context,
      barrierDismissible: false,
      title: context.loc.resumeGameTitle,
      description: context.loc.resumeGameMessage,
      titleIcon: AppImagesAssets.resume,
      actions: [
        CustomButton(
          text: context.loc.resume,
          color: context.appColors.green,
          onTap: () => Navigator.of(context).pop(true),
        ),
        CustomButton(
          text: context.loc.cancel,
          color: context.appColors.red,
          onTap: () => Navigator.of(context).pop(false),
        ),
      ],
    );

    if (!context.mounted) return;

    homeNotifier.clearPendingAction();

    if (shouldResume == true) {
      unawaited(
        context.push('${Routes.game}/${savedGame.mode.toPath()}?resume=true'),
      );
    } else {
      await homeNotifier.deleteSavedGame();
    }
  }
}
