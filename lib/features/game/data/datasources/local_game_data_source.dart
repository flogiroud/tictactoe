import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/providers/storage_service_provider.dart';
import 'package:tictactoe/core/services/storage/storage_service.dart';
import 'package:tictactoe/features/game/domain/entities/game.dart';

part 'local_game_data_source.g.dart';

class LocalGameDataSource {
  const LocalGameDataSource(this._storageService);

  final StorageService _storageService;

  static const String _kGameKey = 'saved_game';

  Future<void> saveGame(Game game) async {
    final json = jsonEncode(game.toJson());
    await _storageService.set(_kGameKey, json);
  }

  Future<Game?> loadGame() async {
    final jsonString = await _storageService.get(_kGameKey) as String?;

    if (jsonString == null) {
      return null;
    }

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return Game.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteGame() async {
    await _storageService.remove(_kGameKey);
  }

  Future<bool> hasGame() async {
    return await _storageService.has(_kGameKey);
  }
}

@Riverpod(keepAlive: true)
LocalGameDataSource localGameDataSource(Ref ref) {
  final storageService = ref.watch(storageServiceProvider);
  return LocalGameDataSource(storageService);
}
