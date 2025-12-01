import 'package:dartz/dartz.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';

abstract interface class GameRepository {
  Future<Either<Failure, void>> saveGame(Game game);

  Future<Either<Failure, Game?>> loadSavedGame();

  Future<Either<Failure, void>> deleteSavedGame();

  Future<Either<Failure, bool>> hasSavedGame();
}
