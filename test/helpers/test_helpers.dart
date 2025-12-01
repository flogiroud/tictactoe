import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/providers/storage_service_provider.dart';
import 'package:tictactoe/core/services/storage/impl/shared_prefs_storage_service.dart';
import 'package:tictactoe/features/game/data/datasources/local_game_data_source.dart';
import 'package:tictactoe/features/game/data/repositories/game_repository_impl.dart';
import 'package:tictactoe/features/game/domain/usecases/delete_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/has_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/load_saved_game_usecase.dart';
import 'package:tictactoe/features/game/domain/usecases/save_game_usecase.dart';

Future<ProviderContainer> createTestContainer({
  List<Override> additionalOverrides = const [],
}) async {
  SharedPreferences.setMockInitialValues({});

  final storageService = SharedPrefsStorageService();
  storageService.init();

  final localDataSource = LocalGameDataSource(storageService);
  final repository = GameRepositoryImpl(localDataSource);
  final saveUseCase = SaveGameUseCase(repository);
  final deleteUseCase = DeleteSavedGameUseCase(repository);
  final hasSavedGameUseCase = HasSavedGameUseCase(repository);
  final loadSavedGameUseCase = LoadSavedGameUseCase(repository);

  return ProviderContainer(
    overrides: [
      storageServiceProvider.overrideWithValue(storageService),
      localGameDataSourceProvider.overrideWithValue(localDataSource),
      gameRepositoryProvider.overrideWithValue(repository),
      saveGameUseCaseProvider.overrideWithValue(saveUseCase),
      deleteSavedGameUseCaseProvider.overrideWithValue(deleteUseCase),
      hasSavedGameUseCaseProvider.overrideWithValue(hasSavedGameUseCase),
      loadSavedGameUseCaseProvider.overrideWithValue(loadSavedGameUseCase),
      ...additionalOverrides,
    ],
  );
}
