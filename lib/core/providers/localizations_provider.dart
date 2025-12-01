import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/l10n/app_localizations.dart';
import 'package:tictactoe/core/observers/locale_observer.dart';

part 'localizations_provider.g.dart';

@Riverpod(keepAlive: true)
AppLocalizations localizations(Ref ref) {
  final locale = WidgetsBinding.instance.platformDispatcher.locale;
  final observer = LocaleObserver((locales) {
    ref.invalidateSelf();
  });
  final binding = WidgetsBinding.instance;

  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return lookupAppLocalizations(locale);
}
