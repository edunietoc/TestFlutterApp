import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<String> readName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'name';
    String value = prefs.getString(key) ?? '';
    return value;
  }

  Future<void> saveName(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = 'name';
    String value = data;
    prefs.setString(key, value);
  }
}
