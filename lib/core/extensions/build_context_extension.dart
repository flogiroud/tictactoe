import 'package:flutter/material.dart';
import 'package:tictactoe/core/extensions/theme_data_extension.dart';
import 'package:tictactoe/core/ui/theme/app_colors_theme.dart';
import 'package:tictactoe/core/ui/theme/app_values_theme.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  ThemeData get theme => Theme.of(this);

  AppColorsTheme get appColors => theme.appColors;

  AppValuesTheme get appValues => theme.appValues;
}
