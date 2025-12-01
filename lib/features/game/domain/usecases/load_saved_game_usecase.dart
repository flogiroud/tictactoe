import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'load_saved_game_usecase.g.dart';

class LoadSavedGameUseCase {
  const LoadSavedGameUseCase(this._repository);

  final GameRepository _repository;

  Future<Either<Failure, Game?>> call() async {
    return await _repository.loadSavedGame();
  }
}

@Riverpod(keepAlive: true)
LoadSavedGameUseCase loadSavedGameUseCase(Ref ref) {
  return LoadSavedGameUseCase(ref.watch(gameRepositoryProvider));
}
