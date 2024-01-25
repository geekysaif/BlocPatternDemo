import 'package:bloc_pattern_demo/common/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveStringPreference(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  saveBoolPreference(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  saveIntPreference(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  saveDoublePreference(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  saveListPreference(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  getStringPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key)??'';
  }

  getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key)??false;
  }

  getIntPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key)??-1;
  }

  getDoublePreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key)??-1;
  }

  getListPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key)??'';
  }

  void clearPreferences() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(Constants.name, "");
    prefs.setString(Constants.accessToken, "");
    prefs.setString(Constants.awsuserId, "");
    prefs.setString(Constants.photo, "");
  }

  void clearPhotoPreferences() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(Constants.photo, "");
  }

  static final AppPreferences _appPreferences = new AppPreferences._internal();
  factory AppPreferences() {
    return _appPreferences;
  }
  AppPreferences._internal();
}

AppPreferences appPreferences = new AppPreferences();