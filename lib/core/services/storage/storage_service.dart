abstract interface class StorageService {
  void init();

  bool get hasInitialized;

  Future<Object?> get(String key);

  Future<bool> set(String key, String value);

  Future<bool> has(String key);

  Future<bool> remove(String key);

  Future<void> clear();
}
