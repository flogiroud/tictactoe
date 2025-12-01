import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/services/storage/impl/shared_prefs_storage_service.dart';
import 'package:tictactoe/features/game/data/datasources/local_game_data_source.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';
import 'package:tictactoe/features/game/domain/entities/game_mode.dart';

void main() {
  group('LocalGameDataSource with StorageService', () {
    late LocalGameDataSource dataSource;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final storageService = SharedPrefsStorageService();
      storageService.init();
      dataSource = LocalGameDataSource(storageService);
    });

    test('can save and load game', () async {
      final game = Game.initial(mode: const GameMode.local());

      await dataSource.saveGame(game);

      final loadedGame = await dataSource.loadGame();

      expect(loadedGame, isNotNull);
      expect(loadedGame!.mode, equals(const GameMode.local()));
      expect(loadedGame.board.isEmpty, isTrue);
    });

    test('hasGame returns true when game is saved', () async {
      expect(await dataSource.hasGame(), isFalse);

      final game = Game.initial(mode: const GameMode.local());
      await dataSource.saveGame(game);

      expect(await dataSource.hasGame(), isTrue);
    });

    test('deleteGame removes saved game', () async {
      final game = Game.initial(mode: const GameMode.local());
      await dataSource.saveGame(game);
      expect(await dataSource.hasGame(), isTrue);

      await dataSource.deleteGame();
      expect(await dataSource.hasGame(), isFalse);
    });
  });
}
