import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreference;
  static init()async{
    sharedPreference=await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  })async
  {
    if(value is String) return await sharedPreference!.setString(key, value);
    if(value is int) return await sharedPreference!.setInt(key, value);
    if(value is bool) return await sharedPreference!.setBool(key, value);

    return await sharedPreference!.setDouble(key, value);
  }
  static dynamic getData({
    required String key,
  })  {
    return sharedPreference!.get(key);
  }
  static Future<bool> removeData({
    required String key,
  })async
  {
    return await sharedPreference!.remove(key);
  }
}