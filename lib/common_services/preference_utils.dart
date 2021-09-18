import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  // Инициализация SP д.б. в main-классе
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  /// Пример применения
  /// PreferenceUtils.setString(AppConstants.USER_NAME, "");
  /// String username = PreferenceUtils.getString(AppConstants.USER_NAME);
  static String getString(String key, [String defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }
}