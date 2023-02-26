import 'package:shared_preferences/shared_preferences.dart';

class Cashhelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> cleardata({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key).then((value) {
      print("uid clear");
      return value;
    });
  }

  static dynamic getdata({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> saveuId(
      {required String key, required String value}) async {
    return await sharedPreferences!.setString(key, value);
  }
}
