import 'package:flutter/material.dart';

class SizeUtils {
  static int getCachedSize({
    required BuildContext context,
    required double size,
  }) => (MediaQuery.of(context).devicePixelRatio * size).floor();
}
