import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'save_game_usecase.g.dart';

class SaveGameUseCase {
  const SaveGameUseCase(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, void>> call(Game game) async {
    if (!game.isPlaying) {
      return const Right(null);
    }

    return await _repository.saveGame(game);
  }
}

@Riverpod(keepAlive: true)
SaveGameUseCase saveGameUseCase(Ref ref) {
  return SaveGameUseCase(ref.watch(gameRepositoryProvider));
}
