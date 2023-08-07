import 'dart:convert';

import 'package:get_storage/get_storage.dart';

/// <<< To store data in phone storage --------- >>>
class GetStorageData {
  String loginData = "LoginData";
  String bankData = "BankData";
  String saveDate = "saveDate";
  String isLogin = "isLogin";
  String userId = "userId";
  String token = "token";
  String email = "email";
  String password = "password";
  String fcmToken = "fcmToken";
  String userLAT = "userLAT";
  String userLNG = "userLNG";
  String userLoc = "userLocation";

  /// <<< To save object data --------- >>>
  saveString(String key, value) async {
    final box = GetStorage();
    return box.write(key, value);
  }

  /// <<< To read object data --------- >>>
  readString(String key) {
    final box = GetStorage();
    if (box.hasData(key)) {
      return box.read(key);
    } else {
      return null;
    }
  }

  /// <<< To remove data --------- >>>
  removeData(String key) async {
    final box = GetStorage();
    return box.remove(key);
  }

  /// <<< To Store Key data --------- >>>
  bool containKey(String key) {
    final box = GetStorage();
    return box.hasData(key);
  }

  saveObject(String key, value) {
    final box = GetStorage();
    String allData = jsonEncode(value);
    box.write(key, allData);
  }

  readObject(String key) {
    final box = GetStorage();
    var result = box.read(key);
    return jsonDecode(result);
  }
}
