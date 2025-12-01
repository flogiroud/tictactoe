import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class AppearAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve? curve;
  final Control control;

  const AppearAnimation({
    super.key,
    required this.child,
    this.curve,
    this.duration = const Duration(seconds: 1),
    this.delay = const Duration(milliseconds: 5),
    this.control = Control.play,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomAnimationBuilder<double>(
        control: control,
        delay: delay,
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 0),
        builder: (context, value, child) => AnimatedOpacity(
          opacity: value,
          curve: curve ?? Spring.elegant,
          duration: duration,
          child: child,
        ),
        child: child,
      ),
    );
  }
}
