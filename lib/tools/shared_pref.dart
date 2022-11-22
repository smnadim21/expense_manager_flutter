import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineData {
  final session = "session";
  final token = "token";
  SharedPreferences sharedPreferences = Get.find<SharedPreferences>();

  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  void setSession(String value) {
    sharedPreferences.setString(session, value);
  }

  String getToken() {
    return sharedPreferences.getString(token) ?? "";
  }

 dynamic getSession() {
    return {};
  }
}
