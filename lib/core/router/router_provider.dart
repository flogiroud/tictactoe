import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/router/routes.dart';
import 'package:tictactoe/core/ui/widgets/page_not_found.dart';
import 'package:tictactoe/core/utils/router_utils.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/presentation/screens/game_screen.dart';
import 'package:tictactoe/features/home/presentation/screens/home_screen.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        name: RouterUtils.routeName(Routes.home),
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '${Routes.game}/:modePath(.*)',
        name: RouterUtils.routeName(Routes.game),
        pageBuilder: (context, state) {
          final mode = GameMode.fromPath(
            state.pathParameters['modePath'] ?? 'local',
          );
          final shouldResume =
              state.uri.queryParameters['resume']?.toLowerCase() == 'true';

          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 200),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            key: state.pageKey,
            child: GameScreen(mode: mode, shouldResume: shouldResume),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          );
        },
      ),
    ],
    errorBuilder: (context, state) => PageNotFound(path: state.uri.path),
  );
}
