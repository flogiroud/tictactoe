import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/l10n/app_localizations.dart';
import 'package:tictactoe/core/router/router_provider.dart';
import 'package:tictactoe/core/ui/theme/app_colors_theme.dart';
import 'package:tictactoe/core/ui/theme/app_theme.dart';
import 'package:tictactoe/core/ui/theme/app_values_theme.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Tic Tac Toe',
      routerConfig: ref.read(routerProvider),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('fr')],
      theme: AppTheme.themeData.copyWith(
        extensions: [AppColorsTheme.dark(), AppValuesTheme()],
      ),
    );
  }
}
