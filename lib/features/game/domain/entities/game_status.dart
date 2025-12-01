import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';

part 'game_status.freezed.dart';
part 'game_status.g.dart';

@freezed
sealed class GameStatus with _$GameStatus {
  const factory GameStatus.playing() = _Playing;
  const factory GameStatus.won(Player winner) = _Won;
  const factory GameStatus.draw() = _Draw;

  factory GameStatus.fromJson(Map<String, dynamic> json) =>
      _$GameStatusFromJson(json);
}
