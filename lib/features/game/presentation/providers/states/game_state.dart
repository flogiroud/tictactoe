import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';

part 'game_state.freezed.dart';

@freezed
sealed class GameState with _$GameState {
  const factory GameState({
    required Game game,
    @Default(false) bool isLoading,
  }) = _GameState;
}
