import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/usecases/has_saved_game_usecase.dart';

import '../../../../helpers/mocks/mock_game_repository.dart';

void main() {
  late HasSavedGameUseCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = HasSavedGameUseCase(mockRepository);
  });

  group('HasSavedGameUseCase', () {
    test('should return true when game is saved', () async {
      mockRepository.setHasSavedGameResult(const Right(true));

      final result = await useCase();

      expect(result, const Right(true));
      result.fold(
        (failure) => fail('Should not return failure'),
        (hasGame) => expect(hasGame, isTrue),
      );
    });

    test('should return false when no game is saved', () async {
      mockRepository.setHasSavedGameResult(const Right(false));

      final result = await useCase();

      expect(result, const Right(false));
      result.fold(
        (failure) => fail('Should not return failure'),
        (hasGame) => expect(hasGame, isFalse),
      );
    });

    test('should return failure when repository returns failure', () async {
      const failure = CacheFailure(message: 'Check failed');
      mockRepository.setHasSavedGameResult(const Left(failure));

      final result = await useCase();

      expect(result, const Left(failure));
      result.fold(
        (f) => expect(f, equals(failure)),
        (hasGame) => fail('Should not return bool'),
      );
    });
  });
}
