import 'package:flutter/material.dart';
import 'package:tictactoe/core/constants/app_assets.dart';
import 'package:tictactoe/core/extensions/build_context_extension.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';

extension PlayerExtension on Player {
  String get icon => switch (this) {
    Player.p1 => AppImagesAssets.o_marker,
    Player.p2 => AppImagesAssets.x_marker,
  };

  Color color(BuildContext context) => switch (this) {
    Player.p1 => context.appColors.primary,
    Player.p2 => context.appColors.secondary,
  };
}
