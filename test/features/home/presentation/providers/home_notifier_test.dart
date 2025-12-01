// ignore_for_file: provider_dependencies
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/usecases/delete_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/load_saved_game_usecase.dart';
import 'package:tictactoe/features/home/presentation/providers/home_notifier.dart';
import 'package:tictactoe/features/home/presentation/providers/states/home_state.dart';

import '../../../../helpers/mocks/mock_game_repository.dart';

void main() {
  group('HomeNotifier', () {
    late ProviderContainer container;
    late HomeNotifier notifier;
    late MockGameRepository mockRepository;

    setUp(() {
      mockRepository = MockGameRepository();
      final loadUseCase = LoadSavedGameUseCase(mockRepository);
      final deleteUseCase = DeleteSavedGameUseCase(mockRepository);

      container = ProviderContainer(
        overrides: [
          loadSavedGameUseCaseProvider.overrideWithValue(loadUseCase),
          deleteSavedGameUseCaseProvider.overrideWithValue(deleteUseCase),
        ],
      );
      notifier = container.read(homeProvider.notifier);
    });

    tearDown(() {
      container.dispose();
      mockRepository.reset();
    });

    test('initial state is empty', () {
      final homeState = container.read(homeProvider);

      expect(homeState.savedGame, isNull);
      expect(homeState.isLoading, isFalse);
      expect(homeState.hasCheckedForSavedGame, isFalse);
      expect(homeState.pendingAction, HomeAction.none);
    });

    group('checkForSavedGame', () {
      test('loads saved game successfully', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));

        await notifier.checkForSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, equals(game));
        expect(homeState.isLoading, isFalse);
        expect(homeState.hasCheckedForSavedGame, isTrue);
        expect(homeState.pendingAction, HomeAction.promptForSavedGame);
      });

      test('handles no saved game', () async {
        mockRepository.setLoadSavedGameResult(const Right(null));

        await notifier.checkForSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, isNull);
        expect(homeState.isLoading, isFalse);
        expect(homeState.hasCheckedForSavedGame, isTrue);
        expect(homeState.pendingAction, HomeAction.none);
      });

      test('handles load failure', () async {
        const failure = CacheFailure(message: 'Load failed');
        mockRepository.setLoadSavedGameResult(const Left(failure));

        await notifier.checkForSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, isNull);
        expect(homeState.isLoading, isFalse);
        expect(homeState.hasCheckedForSavedGame, isTrue);
        expect(homeState.pendingAction, HomeAction.none);
      });

      test('sets loading state during check', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));

        final checkFuture = notifier.checkForSavedGame();

        final homeStateDuringLoad = container.read(homeProvider);
        expect(homeStateDuringLoad.isLoading, isTrue);

        await checkFuture;

        final homeStateAfterLoad = container.read(homeProvider);
        expect(homeStateAfterLoad.isLoading, isFalse);
      });

      test('does not check again if already checked', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));

        await notifier.checkForSavedGame();
        mockRepository.reset();
        mockRepository.setLoadSavedGameResult(const Right(null));

        await notifier.checkForSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, equals(game));
        expect(homeState.hasCheckedForSavedGame, isTrue);
      });
    });

    group('deleteSavedGame', () {
      test('deletes saved game successfully', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));
        mockRepository.setDeleteSavedGameResult(const Right(null));

        await notifier.checkForSavedGame();
        expect(container.read(homeProvider).savedGame, isNotNull);

        await notifier.deleteSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, isNull);
        expect(homeState.pendingAction, HomeAction.none);
      });

      test('handles delete failure', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));
        const failure = CacheFailure(message: 'Delete failed');
        mockRepository.setDeleteSavedGameResult(const Left(failure));

        await notifier.checkForSavedGame();
        final stateBeforeDelete = container.read(homeProvider);

        await notifier.deleteSavedGame();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, equals(stateBeforeDelete.savedGame));
        expect(homeState.pendingAction, equals(stateBeforeDelete.pendingAction));
      });
    });

    group('clearPendingAction', () {
      test('clears pending action', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));

        await notifier.checkForSavedGame();
        expect(
          container.read(homeProvider).pendingAction,
          HomeAction.promptForSavedGame,
        );

        notifier.clearPendingAction();

        final homeState = container.read(homeProvider);
        expect(homeState.pendingAction, HomeAction.none);
        expect(homeState.savedGame, equals(game));
      });
    });

    group('reset', () {
      test('resets state to initial', () async {
        final game = Game.initial(mode: const GameMode.local());
        mockRepository.setLoadSavedGameResult(Right(game));

        await notifier.checkForSavedGame();
        notifier.clearPendingAction();

        notifier.reset();

        final homeState = container.read(homeProvider);
        expect(homeState.savedGame, isNull);
        expect(homeState.isLoading, isFalse);
        expect(homeState.hasCheckedForSavedGame, isFalse);
        expect(homeState.pendingAction, HomeAction.none);
      });
    });
  });
}

