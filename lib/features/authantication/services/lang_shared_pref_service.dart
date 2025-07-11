import 'package:shared_preferences/shared_preferences.dart';

class LangSharedPrefService {
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
}
