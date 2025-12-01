enum Player {
  p1,
  p2;

  Player get opponent => this == Player.p1 ? Player.p2 : Player.p1;
}
