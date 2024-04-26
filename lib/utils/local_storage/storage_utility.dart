import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  /// Save data
  Future<void> saveDate<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  /// Read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  /// Remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  /// Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
