import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';
import 'package:tictactoe/features/game/domain/entities/game_status.dart';
import 'package:tictactoe/features/game/domain/entities/player.dart';
import 'package:tictactoe/features/game/domain/usecases/save_game_usecase.dart';

import '../../../../helpers/mocks/mock_game_repository.dart';

void main() {
  late SaveGameUseCase useCase;
  late MockGameRepository mockRepository;

  setUp(() {
    mockRepository = MockGameRepository();
    useCase = SaveGameUseCase(mockRepository);
  });

  group('SaveGameUseCase', () {
    test('should save game when game is playing', () async {
      final game = Game.initial(mode: const GameMode.local());
      mockRepository.setSaveGameResult(const Right(null));

      final result = await useCase(game);

      expect(result, const Right(null));
      expect(mockRepository.savedGame, equals(game));
    });

    test('should return Right(null) when game is not playing', () async {
      final initialGame = Game.initial(mode: const GameMode.local());
      final game = Game(
        board: initialGame.board,
        currentPlayer: Player.p1,
        status: const GameStatus.won(Player.p1),
        mode: const GameMode.local(),
      );

      final result = await useCase(game);

      expect(result, const Right(null));
      expect(mockRepository.savedGame, isNull);
    });

    test('should return failure when repository returns failure', () async {
      final game = Game.initial(mode: const GameMode.local());
      const failure = CacheFailure(message: 'Save failed');
      mockRepository.setSaveGameResult(const Left(failure));

      final result = await useCase(game);

      expect(result, const Left(failure));
    });

    test('should not call repository when game is won', () async {
      final initialGame = Game.initial(mode: const GameMode.local());
      final game = Game(
        board: initialGame.board,
        currentPlayer: Player.p1,
        status: const GameStatus.won(Player.p1),
        mode: const GameMode.local(),
      );

      await useCase(game);

      expect(mockRepository.savedGame, isNull);
    });

    test('should not call repository when game is draw', () async {
      final initialGame = Game.initial(mode: const GameMode.local());
      final game = Game(
        board: initialGame.board,
        currentPlayer: Player.p1,
        status: const GameStatus.draw(),
        mode: const GameMode.local(),
      );

      await useCase(game);

      expect(mockRepository.savedGame, isNull);
    });
  });
}
