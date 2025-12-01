import 'package:flutter/material.dart';

class AppColorsTheme extends ThemeExtension<AppColorsTheme> {
  static const _blueLight = Color(0xFFB8D0FF);
  static const _blue = Color(0xFF2574FF);
  static const _blueDark = Color(0xFF0447BB);
  static const _yellow = Color(0xFFEFC609);
  static const _red = Color(0xFFE6311F);
  static const _greyDark = Color(0xFF353C52);
  static const _green = Color(0xFF2EDD1B);
  static const _purple = Color(0xFFB316ED);
  static const _orange = Color(0xFFEE7527);
  static const _black = Color(0xFF000000);

  final Color primaryLight;
  final Color primary;
  final Color primaryDark;
  final Color secondary;
  final Color error;
  final Color success;
  final Color disabled;
  final Color red;
  final Color green;
  final Color purple;
  final Color orange;
  final Color border;

  const AppColorsTheme._internal({
    required this.primaryLight,
    required this.primary,
    required this.primaryDark,
    required this.secondary,
    required this.error,
    required this.success,
    required this.disabled,
    required this.red,
    required this.green,
    required this.purple,
    required this.orange,
    required this.border,
  });

  factory AppColorsTheme.dark() {
    return const AppColorsTheme._internal(
      primaryLight: _blueLight,
      primary: _blue,
      primaryDark: _blueDark,
      secondary: _yellow,
      error: _red,
      success: _green,
      disabled: _greyDark,
      red: _red,
      green: _green,
      purple: _purple,
      orange: _orange,
      border: _black,
    );
  }

  @override
  ThemeExtension<AppColorsTheme> copyWith({bool? lightMode}) =>
      AppColorsTheme.dark();

  @override
  ThemeExtension<AppColorsTheme> lerp(
    covariant ThemeExtension<AppColorsTheme>? other,
    double t,
  ) => this;
}
