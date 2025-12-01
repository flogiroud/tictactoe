import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';

part 'home_state.freezed.dart';

enum HomeAction { none, promptForSavedGame }

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    Game? savedGame,
    @Default(false) bool isLoading,
    @Default(false) bool hasCheckedForSavedGame,
    @Default(HomeAction.none) HomeAction pendingAction,
  }) = _HomeState;

  const HomeState._();

  bool get hasSavedGame => savedGame != null;
  bool get hasPendingAction => pendingAction != HomeAction.none;
}
