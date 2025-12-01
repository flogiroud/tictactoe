import 'package:tictactoe/features/game/domain/entities/player.dart';

enum CellState {
  empty,
  p1,
  p2;

  bool get isEmpty => this == CellState.empty;

  static CellState fromPlayer(Player player) =>
      player == Player.p1 ? CellState.p1 : CellState.p2;

  Player? get toPlayer => switch (this) {
    CellState.p1 => Player.p1,
    CellState.p2 => Player.p2,
    CellState.empty => null,
  };
}
