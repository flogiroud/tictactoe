import 'package:flutter/material.dart';
import 'package:tictactoe/core/ui/theme/app_colors_theme.dart';

abstract class AppTheme {
  static const String fontFamily = 'Averta';

  static ThemeData get themeData => ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColorsTheme.dark().primary, // NOTE: Dark theme only for now
      onPrimary: Colors.white,
      secondary: AppColorsTheme.dark().secondary,
      onSecondary: Colors.white,
      error: AppColorsTheme.dark().error,
      onError: Colors.white,
      surface: AppColorsTheme.dark().primaryDark,
      onSurface: Colors.white,
    ),
    fontFamily: fontFamily,
    textTheme: _textTheme,
  );

  static TextTheme get _textTheme => const TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 35,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 23,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 21,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 19,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 17,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w900,
      height: 1.25,
      color: Colors.white,
      shadows: [
        Shadow(color: Colors.black, blurRadius: 0, offset: Offset(0, 3)),
      ],
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 15,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w700,
      height: 1.25,
      color: Colors.white,
    ),
  );
}
