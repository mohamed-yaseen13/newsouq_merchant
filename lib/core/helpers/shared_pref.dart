import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // user email key
  static const String userEmailKey = 'userEmailKey';

  // set user email
  static Future<void> setUserEmail(String email) async {
    await _prefs!.setString(userEmailKey, email);
  }

  // get user email
  static String getUserEmail() {
    return _prefs!.getString(userEmailKey) ?? '';
  }

  // user name key
  static const String userNameKey = 'userNameKey';

  // set user name
  static Future<void> setUserName(String name) async {
    await _prefs!.setString(userNameKey, name);
  }

  // get user name
  static String getUsername() {
    return _prefs!.getString(userNameKey) ?? '';
  }
}
