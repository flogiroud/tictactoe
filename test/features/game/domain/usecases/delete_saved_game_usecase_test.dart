import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/usecases/delete_saved_game_usecase.dart';

import '../../../../helpers/mocks/mock_game_repository.dart';

void main() {
  late DeleteSavedGameUseCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = DeleteSavedGameUseCase(mockRepository);
  });

  group('DeleteSavedGameUseCase', () {
    test('should delete saved game successfully', () async {
      mockRepository.setDeleteSavedGameResult(const Right(null));

      final result = await useCase();

      expect(result, const Right(null));
      expect(mockRepository.deleteCalled, isTrue);
    });

    test('should return failure when repository returns failure', () async {
      const failure = CacheFailure(message: 'Delete failed');
      mockRepository.setDeleteSavedGameResult(const Left(failure));

      final result = await useCase();

      expect(result, const Left(failure));
      expect(mockRepository.deleteCalled, isTrue);
      result.fold(
        (f) => expect(f, equals(failure)),
        (_) => fail('Should not return success'),
      );
    });

    test('should call repository deleteSavedGame method', () async {
      mockRepository.setDeleteSavedGameResult(const Right(null));

      await useCase();

      expect(mockRepository.deleteCalled, isTrue);
    });
  });
}
