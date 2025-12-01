import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:simple_animations/simple_animations.dart';

class TranslateAnimation extends StatelessWidget {
  final Control? control;
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve? curve;
  final Offset? beginOffset;
  final Offset? destinationOffset;
  final bool disabled;

  const TranslateAnimation({
    super.key,
    required this.child,
    this.control = Control.play,
    this.curve,
    this.duration = const Duration(milliseconds: 600),
    this.delay = const Duration(milliseconds: 0),
    this.beginOffset,
    this.destinationOffset,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    if (disabled) return child;
    return RepaintBoundary(
      child: CustomAnimationBuilder<Offset>(
        control: control ?? Control.play,
        tween: Tween<Offset>(
          begin: beginOffset ?? Offset.zero,
          end: destinationOffset ?? Offset.zero,
        ),
        delay: delay,
        duration: duration,
        curve: curve ?? Spring.stern,
        child: child,
        builder: (_, value, child) =>
            Transform.translate(offset: value, child: child),
      ),
    );
  }
}
