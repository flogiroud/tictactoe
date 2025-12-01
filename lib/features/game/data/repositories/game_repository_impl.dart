import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/core/utils/logger.dart';
import 'package:tictactoe/features/game/data/datasources/local_game_data_source.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

part 'game_repository_impl.g.dart';

class GameRepositoryImpl implements GameRepository {
  const GameRepositoryImpl(this._localDataSource);

  final LocalGameDataSource _localDataSource;

  @override
  Future<Either<Failure, void>> saveGame(Game game) async {
    try {
      await _localDataSource.saveGame(game);
      return const Right(null);
    } catch (e) {
      logger.e('Error saving game: $e');
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Game?>> loadSavedGame() async {
    try {
      final game = await _localDataSource.loadGame();

      return Right(game);
    } on FormatException catch (e) {
      logger.e('Error parsing saved game: $e');
      await _localDataSource.deleteGame();
      return Left(ValidationFailure(message: e.toString()));
    } catch (e) {
      logger.e('Error loading saved game: $e');
      await _localDataSource.deleteGame();
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSavedGame() async {
    try {
      await _localDataSource.deleteGame();
      return const Right(null);
    } catch (e) {
      logger.e('Error deleting saved game: $e');
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> hasSavedGame() async {
    try {
      final hasGame = await _localDataSource.hasGame();

      return Right(hasGame);
    } catch (e) {
      logger.e('Error checking saved game: $e');
      return Left(CacheFailure(message: e.toString()));
    }
  }
}

@Riverpod(keepAlive: true)
GameRepository gameRepository(Ref ref) {
  return GameRepositoryImpl(ref.watch(localGameDataSourceProvider));
}
