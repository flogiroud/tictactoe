import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class RotationAnimation extends StatelessWidget {
  final Control? control;
  final Widget child;
  final Duration duration;
  final Duration delay;

  const RotationAnimation({
    super.key,
    required this.child,
    this.control = Control.loop,
    this.duration = const Duration(seconds: 6),
    this.delay = const Duration(milliseconds: 0),
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomAnimationBuilder<double>(
        control: control ?? Control.play,
        tween: Tween<double>(begin: 0, end: 1),
        delay: delay,
        duration: duration,
        curve: Curves.linear,
        child: child,
        builder: (_, value, child) => Transform.rotate(
          angle: value * pi * 2,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
