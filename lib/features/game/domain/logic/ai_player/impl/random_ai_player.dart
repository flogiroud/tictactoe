import 'dart:math';

import 'package:tictactoe/features/game/domain/entities/board.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';
import 'package:tictactoe/features/game/domain/logic/ai_player/ai_player.dart';

class RandomAiPlayer implements AiPlayer {
  const RandomAiPlayer();

  @override
  Position calculateMove(Board board, Player aiPlayer) {
    final emptyCells = <Position>[];

    for (var row = 0; row < board.size; row++) {
      for (var col = 0; col < board.size; col++) {
        final pos = Position(row: row, col: col);
        if (board.getAt(pos).isEmpty) {
          emptyCells.add(pos);
        }
      }
    }

    if (emptyCells.isEmpty) {
      throw StateError('No empty cells available');
    }

    final random = Random();
    return emptyCells[random.nextInt(emptyCells.length)];
  }
}
