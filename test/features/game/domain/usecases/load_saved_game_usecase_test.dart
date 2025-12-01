import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/usecases/load_saved_game_usecase.dart';

import '../../../../helpers/mocks/mock_game_repository.dart';

void main() {
  late LoadSavedGameUseCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = LoadSavedGameUseCase(mockRepository);
  });

  group('LoadSavedGameUseCase', () {
    test('should return game when repository returns game', () async {
      final game = Game.initial(mode: const GameMode.local());
      mockRepository.setLoadSavedGameResult(Right(game));

      final result = await useCase();

      expect(result, Right(game));
      result.fold(
        (failure) => fail('Should not return failure'),
        (loadedGame) => expect(loadedGame, equals(game)),
      );
    });

    test('should return null when no game is saved', () async {
      mockRepository.setLoadSavedGameResult(const Right(null));

      final result = await useCase();

      expect(result, const Right(null));
      result.fold(
        (failure) => fail('Should not return failure'),
        (loadedGame) => expect(loadedGame, isNull),
      );
    });

    test('should return failure when repository returns failure', () async {
      const failure = CacheFailure(message: 'Load failed');
      mockRepository.setLoadSavedGameResult(const Left(failure));

      final result = await useCase();

      expect(result, const Left(failure));
      result.fold(
        (f) => expect(f, equals(failure)),
        (game) => fail('Should not return game'),
      );
    });

    test(
      'should return ValidationFailure when repository returns ValidationFailure',
      () async {
        const failure = ValidationFailure(message: 'Invalid game data');
        mockRepository.setLoadSavedGameResult(const Left(failure));

        final result = await useCase();

        expect(result, const Left(failure));
        result.fold(
          (f) => expect(f, equals(failure)),
          (game) => fail('Should not return game'),
        );
      },
    );
  });
}
