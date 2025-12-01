import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tictactoe/core/services/storage/storage_service.dart';

class SharedPrefsStorageService implements StorageService {
  SharedPreferences? _sharedPreferences;
  final Completer<SharedPreferences> _initCompleter =
      Completer<SharedPreferences>();

  @override
  void init() {
    _initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  bool get hasInitialized => _sharedPreferences != null;

  @override
  Future<Object?> get(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences!.get(key);
  }

  @override
  Future<bool> set(String key, String value) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences!.setString(key, value);
  }

  @override
  Future<bool> has(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences?.containsKey(key) ?? false;
  }

  @override
  Future<bool> remove(String key) async {
    _sharedPreferences = await _initCompleter.future;
    return _sharedPreferences!.remove(key);
  }

  @override
  Future<void> clear() async {
    _sharedPreferences = await _initCompleter.future;
    await _sharedPreferences!.clear();
  }
}
