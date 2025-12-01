import 'package:dartz/dartz.dart';
import 'package:tictactoe/core/errors/failure.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/repositories/game_repository.dart';

class MockGameRepository implements GameRepository {
  Either<Failure, void>? _saveGameResult;
  Either<Failure, Game?>? _loadSavedGameResult;
  Either<Failure, void>? _deleteSavedGameResult;
  Either<Failure, bool>? _hasSavedGameResult;

  Game? _savedGame;
  bool _deleteCalled = false;

  void setSaveGameResult(Either<Failure, void> result) {
    _saveGameResult = result;
  }

  void setLoadSavedGameResult(Either<Failure, Game?> result) {
    _loadSavedGameResult = result;
  }

  void setDeleteSavedGameResult(Either<Failure, void> result) {
    _deleteSavedGameResult = result;
  }

  void setHasSavedGameResult(Either<Failure, bool> result) {
    _hasSavedGameResult = result;
  }

  Game? get savedGame => _savedGame;
  bool get deleteCalled => _deleteCalled;

  void reset() {
    _saveGameResult = null;
    _loadSavedGameResult = null;
    _deleteSavedGameResult = null;
    _hasSavedGameResult = null;
    _savedGame = null;
    _deleteCalled = false;
  }

  @override
  Future<Either<Failure, void>> saveGame(Game game) async {
    _savedGame = game;
    return _saveGameResult ?? const Right(null);
  }

  @override
  Future<Either<Failure, Game?>> loadSavedGame() async {
    return _loadSavedGameResult ?? const Right(null);
  }

  @override
  Future<Either<Failure, void>> deleteSavedGame() async {
    _deleteCalled = true;
    return _deleteSavedGameResult ?? const Right(null);
  }

  @override
  Future<Either<Failure, bool>> hasSavedGame() async {
    return _hasSavedGameResult ?? const Right(false);
  }
}
