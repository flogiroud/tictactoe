import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/core/constants/app_constants.dart';
import 'package:tictactoe/features/game/domain/entities/board.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/entities/position.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
sealed class Game with _$Game {
  const factory Game({
    required Board board,
    required Player currentPlayer,
    required GameStatus status,
    required GameMode mode,
    @Default([]) List<Position> winningLine,
    @Default(0) int moveCount,
  }) = _Game;

  const Game._();

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  factory Game.initial({
    int size = kDefaultBoardSize,
    GameMode mode = const GameMode.local(),
  }) => Game(
    board: Board.empty(size: size),
    currentPlayer: Player.p1,
    status: const GameStatus.playing(),
    mode: mode,
  );

  bool get isPlaying => status == const GameStatus.playing();

  bool get isGameOver => !isPlaying;
}
