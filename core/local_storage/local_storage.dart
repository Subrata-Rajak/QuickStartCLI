import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static LocalStorage instance = LocalStorage();

  Future<bool> writeStringToLocalDb({
    required String key,
    required String value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await prefs.setString(key, value);
    return res;
  }

  Future<bool> writeBoolToLocalDb({
    required String key,
    required bool value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await prefs.setBool(key, value);
    return res;
  }

  Future<bool> writeStringListToLocalDb({
    required String key,
    required List<String> value,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await prefs.setStringList(key, value);
    return res;
  }

  Future<bool?> readBoolFromLocalDb({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getBool(key);
    return res;
  }

  Future<String?> readStringFromLocalDb({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(key);
    return res;
  }

  Future<List<String>?> readStringListFromLocalDb({
    required String key,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getStringList(key);
    return res;
  }

  Future<bool> clearCache() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = await prefs.clear();
    return res;
  }
}
