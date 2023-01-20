import 'package:shared_preferences/shared_preferences.dart';

class Helpers {
  //set user pin
  static Future<bool> setUsrPin(pin) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool('pin', pin);
  }

  //get User pin
  static Future<bool> getUsrPin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('pin') ?? false;
    // print("get token : $token");
  }

  //set token login
  static Future setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  //get token
  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  // set user data
  static Future setUserData(key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  //get user data
  static Future<String> getUserData(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
}
