import 'package:flutter/material.dart';

class AppValuesTheme extends ThemeExtension<AppValuesTheme> {
  static const _borderRadius = 3.0;
  static const _borderWidth = 1.5;

  final double borderRadius;
  final double borderWidth;

  const AppValuesTheme._internal({
    required this.borderRadius,
    required this.borderWidth,
  });

  factory AppValuesTheme() {
    return const AppValuesTheme._internal(
      borderRadius: _borderRadius,
      borderWidth: _borderWidth,
    );
  }

  @override
  ThemeExtension<AppValuesTheme> copyWith({bool? lightMode}) =>
      AppValuesTheme();

  @override
  ThemeExtension<AppValuesTheme> lerp(
    covariant ThemeExtension<AppValuesTheme>? other,
    double t,
  ) => this;
}
