import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color get lighten {
    final redChannel = this.r * 255;
    final greenChannel = this.g * 255;
    final blueChannel = this.b * 255;

    final r = (redChannel + ((255 - redChannel) * .3)).toInt();
    final g = (greenChannel + ((255 - greenChannel) * .3)).toInt();
    final b = (blueChannel + ((255 - blueChannel) * .3)).toInt();

    return Color.fromRGBO(r, g, b, 1);
  }

  Color get darken {
    final redChannel = this.r * 255;
    final greenChannel = this.g * 255;
    final blueChannel = this.b * 255;

    final r = (redChannel * (1 - .3)).toInt();
    final g = (greenChannel * (1 - .3)).toInt();
    final b = (blueChannel * (1 - .3)).toInt();

    return Color.fromRGBO(r, g, b, 1);
  }
}
