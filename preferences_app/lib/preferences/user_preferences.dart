import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name => _prefs.getString('name') ?? '';

  static set name(String value) {
    _prefs.setString('name', value);
  }

  static bool get isDarkMode => _prefs.getBool('isDarkMode') ?? false;

  static set isDarkMode(bool value) {
    _prefs.setBool('isDarkMode', value);
  }

  static int get gender => _prefs.getInt('gender') ?? 1;

  static set gender(int value) {
    _prefs.setInt('gender', value);
  }
}
