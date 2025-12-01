import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tictactoe/core/services/storage/impl/shared_prefs_storage_service.dart';
import 'package:tictactoe/core/services/storage/storage_service.dart';

part 'storage_service_provider.g.dart';

@Riverpod(keepAlive: true)
StorageService storageService(Ref ref) {
  final service = SharedPrefsStorageService();

  service.init();
  return service;
}
