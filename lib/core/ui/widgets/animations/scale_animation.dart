import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:simple_animations/simple_animations.dart';

class ScaleAnimation extends StatelessWidget {
  final Control? control;
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve? curve;
  final bool disabled;

  const ScaleAnimation({
    super.key,
    required this.child,
    this.control = Control.play,
    this.curve,
    this.duration = const Duration(milliseconds: 600),
    this.delay = const Duration(milliseconds: 0),
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (disabled) return child;
    return RepaintBoundary(
      child: CustomAnimationBuilder<double>(
        control: control ?? Control.play,
        tween: Tween<double>(begin: 0, end: 1),
        delay: delay,
        duration: duration,
        curve: curve ?? Spring.stern,
        child: child,
        builder: (_, value, child) => Transform.scale(
          scale: value,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
