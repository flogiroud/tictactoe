import 'package:flutter/material.dart';
import 'package:tictactoe/core/ui/theme/app_colors_theme.dart';
import 'package:tictactoe/core/ui/theme/app_values_theme.dart';

extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors => extension<AppColorsTheme>()!;
  AppValuesTheme get appValues => extension<AppValuesTheme>()!;
}
