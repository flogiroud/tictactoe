import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tictactoe/core/extensions/string_extension.dart';
import 'package:tictactoe/core/utils/size_utils.dart';

class BasicIcon extends StatelessWidget {
  final String icon;
  final double size;
  final Color? color;
  final int? cacheWidth;

  const BasicIcon(
    this.icon, {
    super.key,
    this.size = 32,
    this.color,
    this.cacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (icon.isSvg) {
      return SvgPicture.asset(
        icon,
        height: size,
        width: size,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        icon,
        height: size,
        width: size,
        cacheWidth:
            cacheWidth ?? SizeUtils.getCachedSize(context: context, size: size),
      );
    }
  }
}
