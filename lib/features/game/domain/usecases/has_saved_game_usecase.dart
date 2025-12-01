import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'has_saved_game_usecase.g.dart';

class HasSavedGameUseCase {
  const HasSavedGameUseCase(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, bool>> call() async {
    return await _repository.hasSavedGame();
  }
}

@Riverpod(keepAlive: true)
HasSavedGameUseCase hasSavedGameUseCase(Ref ref) {
  return HasSavedGameUseCase(ref.watch(gameRepositoryProvider));
}
