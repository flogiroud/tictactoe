import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_physics/flutter_physics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/providers/audio_service_provider.dart';
import 'package:tictactoe/core/services/audio/enums/app_sound.dart';
import 'package:tictactoe/core/utils/haptic_feedbacks_utils.dart';

enum CustomGestureDetectorMode { tapLight, tap, scale, none }

class CustomGestureDetector extends ConsumerStatefulWidget {
  final Widget child;
  final void Function()? onTap;
  final bool isDisabled;
  final CustomGestureDetectorMode mode;
  final AppSound? sound;

  const CustomGestureDetector({
    super.key,
    required this.child,
    this.onTap,
    this.isDisabled = false,
    this.mode = CustomGestureDetectorMode.tapLight,
    this.sound,
  });

  @override
  ConsumerState<CustomGestureDetector> createState() =>
      _CustomGestureDetectorState();
}

class _CustomGestureDetectorState extends ConsumerState<CustomGestureDetector>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 0.085,
    ).animate(CurvedAnimation(parent: _controller, curve: Spring.elegant));
    _controller.addStatusListener(_statusListener);
    super.initState();
  }

  void _statusListener(AnimationStatus status) async {
    if (status == AnimationStatus.dismissed &&
        widget.mode == CustomGestureDetectorMode.scale) {
      HapticFeedbackUtils.soft();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_statusListener);
    _controller.dispose();
    super.dispose();
  }

  Future<void> _animationForward() async {
    if (widget.mode == CustomGestureDetectorMode.scale) {
      await _controller.forward();
    }
  }

  Future<void> _animationReverse() async {
    if (widget.mode == CustomGestureDetectorMode.scale) {
      await _controller.reverse();
      HapticFeedbackUtils.selection();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDisabled) return widget.child;

    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform.scale(scale: 1.0 - _animation.value, child: child);
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) {
          _animationForward();
          if (widget.mode != CustomGestureDetectorMode.none) {
            if (widget.mode == CustomGestureDetectorMode.tapLight) {
              HapticFeedbackUtils.light();
            } else {
              HapticFeedbackUtils.medium();
            }
          }
        },
        onTapUp: (_) => _animationReverse(),
        onTapCancel: _animationReverse,
        onTap: widget.onTap == null
            ? null
            : () {
                if (widget.onTap != null) {
                  unawaited(
                    ref
                        .read(audioServiceProvider)
                        .play(widget.sound ?? AppSound.click),
                  );
                  widget.onTap!();
                  unawaited(_animationReverse());
                }
              },
        child: widget.child,
      ),
    );
  }
}
