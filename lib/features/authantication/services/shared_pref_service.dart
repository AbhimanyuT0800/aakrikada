import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late final SharedPreferences prefs;

  //  method inializing shared pref
  static Future<void> initializePref() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_lang', 'en');
  }

  //  method for update shared pref
  static Future<void> updateLang(String value) async {
    await prefs.setString('selected_lang', value);
  }

  // returns selected language default ENGLISH
  static String getPrefLang() {
    final value = prefs.getString('selected_lang');
    return value ?? 'en';
  }

  // Id Stores

  // add user id on shared pref
  static Future<void> addUserId(String value) async {
    await prefs.setString('user_id', value);
  }

  // get user id else return null
  static String? getUserId() {
    final value = prefs.getString('user_id');
    return value;
  }
}
