import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'delete_saved_game_usecase.g.dart';

class DeleteSavedGameUseCase {
  const DeleteSavedGameUseCase(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, void>> call() async {
    return await _repository.deleteSavedGame();
  }
}

@Riverpod(keepAlive: true)
DeleteSavedGameUseCase deleteSavedGameUseCase(Ref ref) {
  return DeleteSavedGameUseCase(ref.watch(gameRepositoryProvider));
}
