import 'package:flutter/material.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double strokeWidth;

  const BorderedText({
    super.key,
    required this.text,
    this.style,
    this.strokeWidth = 2.5,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.bodyLarge;

    return Stack(
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Text(
                text,
                style: textStyle?.copyWith(
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = strokeWidth
                    ..color = context.appColors.border,
                ),
              ),
              Text(text, style: textStyle?.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
