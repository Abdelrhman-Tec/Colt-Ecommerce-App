import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Here The Initialize of cache .
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! this method to put data in local database using key

  static String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! this method to put data in local database using key

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    if (value is List || value is Map) {
      return await sharedPreferences.setString(key, jsonEncode(value));
    }

    throw Exception("Unsupported type for SharedPreferences");
  }

  //! this method to get data already saved in local database

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! remove data using specific key

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! this method to check if local database contains {key}
  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! clear all data in the local database
  Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //! this method to put data in local database using key
  Future<dynamic> put({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }
}
