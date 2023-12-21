abstract class KeyValueStorageService {
  Future<bool> removeKeyValue<T>(String key);
  Future<void> setKeyValue<T>(String key, T value);
  Future<T?> getValue<T>(String key);
}
