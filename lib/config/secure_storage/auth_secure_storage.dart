import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthSecureStorage 
{  
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static String lupeUser = 'lupeUser';

  static Future<void> writeData(
  {
    required String key, 
    required String value,
  }) async => await _storage.write(key: key, value: value);
  
  static Future<String> readData(String key) async => await _storage.read(key: key) ?? '';
  static Future<void> eraseByKey(String key) async => _storage.delete(key: key);
  static Future<void> eraseAllData() async => _storage.deleteAll();
}