import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/features/game/domain/usecases/delete_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/load_saved_game_usecase.dart';
import 'package:tictactoe/features/home/presentation/providers/states/home_state.dart';

part 'home_notifier.g.dart';

@Riverpod(keepAlive: true)
class HomeNotifier extends _$HomeNotifier {
  late final LoadSavedGameUseCase _loadSavedGameUseCase;
  late final DeleteSavedGameUseCase _deleteSavedGameUseCase;

  @override
  HomeState build() {
    _loadSavedGameUseCase = ref.read(loadSavedGameUseCaseProvider);
    _deleteSavedGameUseCase = ref.read(deleteSavedGameUseCaseProvider);
    return const HomeState();
  }

  Future<void> checkForSavedGame() async {
    if (state.hasCheckedForSavedGame) return;

    state = state.copyWith(isLoading: true);

    final result = await _loadSavedGameUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          savedGame: null,
          isLoading: false,
          hasCheckedForSavedGame: true,
          pendingAction: HomeAction.none,
        );
      },
      (savedGame) {
        state = state.copyWith(
          savedGame: savedGame,
          isLoading: false,
          hasCheckedForSavedGame: true,
          pendingAction: savedGame != null
              ? HomeAction.promptForSavedGame
              : HomeAction.none,
        );
      },
    );
  }

  Future<void> deleteSavedGame() async {
    final result = await _deleteSavedGameUseCase();

    result.fold((failure) => {}, (_) {
      state = state.copyWith(savedGame: null, pendingAction: HomeAction.none);
    });
  }

  void clearPendingAction() =>
      state = state.copyWith(pendingAction: HomeAction.none);

  void reset() => state = const HomeState();
}
