import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static  SharedPreferences? _prefs;

  static Future initMySharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void clearSharedPreferences() {
    _prefs?.clear();
    return;
  }

  static Future setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String getString(String key) {
    final String? value = _prefs?.getString(key);
    return value ?? "";
  }

  static Future setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int getInt(String key) {
    final int? value = _prefs?.getInt(key);
    return value ?? 0;
  }

  static Future setHour(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int getHour(String key) {
    final int? value = _prefs?.getInt(key);
    return value ?? 0;
  }


  static Future setMin(String key, int value) async {
    await _prefs?.setInt(key, value);
  }
  static int getMin(String key) {
    final int? value = _prefs?.getInt(key);
    return value ?? 0;
  }
  static Future setSec(String key, int value) async {
    await _prefs?.setInt(key, value);
  }
  static int getSec(String key) {
    final int? value = _prefs?.getInt(key);
    return value ?? 0;
  }


  static Future setBoolean(String key, {required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  static bool getBoolean(String key) {
    final bool? value = _prefs?.getBool(key);
    return value ?? false;
  }

  static Future setTerms(String key, {required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  static bool getTerms(String key) {
    final bool? value = _prefs?.getBool(key);
    return value ?? false;
  }

  static Future setLocationPopup(String key, {required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  static bool getLocationPopup(String key) {
    final bool? value = _prefs?.getBool(key);
    return value ?? false;
  }

  static Future setLocationPermission(String key, {required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  static bool getLocationPermission(String key) {
    final bool? value = _prefs?.getBool(key);
    return value ?? false;
  }

  static Future setImageCreatePagePermission(String key, {required bool value}) async {
    await _prefs?.setBool(key, value);
  }

  static bool getImageCreatePagePermission(String key) {
    final bool? value = _prefs?.getBool(key);
    return value ?? false;
  }


  static Future setLong(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  static double getLong(String key) {
    final double? value = _prefs?.getDouble(key);
    return value ?? 0.0;
  }

  static Future setInt1(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  static int getInt1(String key) {
    final int? value = _prefs?.getInt(key);
    return value ?? 0;
  }

  // static Future setTime(String key, String value) async {
  //   await _prefs?.setString(key, value);
  // }
  //
  // static String getTime(String key) {
  //   final String? value = _prefs?.getString(key);
  //   return value ?? "";
  // }

  static Future imageListSet(String key, List<String> imageList) async {
    await _prefs?.setStringList(key, imageList);
  }

  static List<String> imageListGet(String key,) {
    return _prefs?.getStringList(key) ?? [];
  }

  // static Future<void> setTime( int hour, int minute, int second) async {
  //   await AppPreference?.setHour('hour', hour);
  //   await AppPreference?.setMin('minute', minute);
  //   await AppPreference?.setSec('second', second);
  // }
  //
  // static List<int> getTime() {
  //   final hour = AppPreference?.getHour('hour') ?? 0;
  //   final minute = AppPreference?.getMin('minute') ?? 0;
  //   final second = AppPreference?.getSec('second') ?? 0;
  //   return [hour, minute, second];
  // }

}
