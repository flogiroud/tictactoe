import 'package:flutter/widgets.dart';
import 'package:tictactoe/core/l10n/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
