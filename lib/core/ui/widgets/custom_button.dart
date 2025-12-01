import 'package:flutter/material.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/core/extensions/color_extension.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/ui/widgets/basic_icon.dart';
import 'package:tictactoe/core/ui/widgets/bordered_text.dart';
import 'package:tictactoe/core/ui/widgets/custom_gesture_detector.dart';

enum CustomButtonSize { small, large }

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final Color? color;
  final CustomButtonSize size;
  final String? icon;
  final String? text;
  final bool isDisabled;
  final bool textUppercase;
  final AppSound? sound;

  const CustomButton({
    super.key,
    required this.onTap,
    this.color,
    this.size = CustomButtonSize.large,
    this.icon,
    this.text,
    this.isDisabled = false,
    this.textUppercase = true,
    this.sound,
  });

  double get _height => size == CustomButtonSize.small ? 40 : 56;
  double get _width => size == CustomButtonSize.small ? 56 : 200;
  double get _yShadowOffset => size == CustomButtonSize.small ? 1.5 : 3;
  double get _iconSize => size == CustomButtonSize.small ? 24 : 40;
  double get _iconOverlapVerticalOffset => text == null
      ? 0
      : size == CustomButtonSize.small
      ? 12
      : 16;
  double get _textOverlapVerticalOffset => icon == null
      ? 0
      : size == CustomButtonSize.small
      ? 6
      : 10;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDisabled
        ? context.appColors.disabled
        : color ?? context.appColors.primary;

    return CustomGestureDetector(
      mode: CustomGestureDetectorMode.scale,
      isDisabled: isDisabled,
      sound: sound,
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(
                context.appValues.borderRadius,
              ),
              border: Border.all(
                color: context.appColors.border,
                width: context.appValues.borderWidth,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.appColors.border.withValues(alpha: .5),
                  blurRadius: 0,
                  offset: Offset(_yShadowOffset / 2, _yShadowOffset),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: _ButtonDecorations(
              backgroundColor: backgroundColor,
              size: size,
              radius: context.appValues.borderRadius,
              borderWidth: context.appValues.borderWidth,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size == CustomButtonSize.small ? 4 : 8,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  if (text != null)
                    Positioned.fill(
                      top: _textOverlapVerticalOffset,
                      bottom: -_textOverlapVerticalOffset,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: BorderedText(
                          text: textUppercase ? text!.toUpperCase() : text!,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  if (icon != null)
                    Positioned.fill(
                      top: -_iconOverlapVerticalOffset,
                      bottom: _iconOverlapVerticalOffset,
                      child: Center(child: BasicIcon(icon!, size: _iconSize)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonDecorations extends StatelessWidget {
  final Color backgroundColor;
  final CustomButtonSize size;
  final double radius;
  final double borderWidth;

  const _ButtonDecorations({
    required this.backgroundColor,
    required this.size,
    required this.radius,
    required this.borderWidth,
  });

  double get _verticalLineHeight => size == CustomButtonSize.small ? 3 : 5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: borderWidth,
          right: borderWidth,
          top: borderWidth,
          child: Container(
            height: _verticalLineHeight,
            decoration: BoxDecoration(
              color: backgroundColor.lighten,
              borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
            ),
          ),
        ),
        Positioned(
          left: borderWidth,
          right: borderWidth,
          bottom: borderWidth,
          child: Container(
            height: _verticalLineHeight,
            decoration: BoxDecoration(
              color: backgroundColor.darken,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(radius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
