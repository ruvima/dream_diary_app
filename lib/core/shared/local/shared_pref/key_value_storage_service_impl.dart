import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        return prefs.getInt(key) as T?;
      case String:
        return prefs.getString(key) as T?;
      case bool:
        return prefs.getBool(key) as T?;

      default:
        throw UnimplementedError(
            'GET no implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPrefs();

    switch (T) {
      case int:
        prefs.setInt(key, value as int);
      case String:
        prefs.setString(key, value as String);
      case bool:
        prefs.setBool(key, value as bool);

      default:
        throw UnimplementedError(
            'SET no implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKeyValue<T>(String key) async {
    final prefs = await getSharedPrefs();

    return await prefs.remove(key);
  }
}
