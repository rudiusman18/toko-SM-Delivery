import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_sm_delivery/Models/user_model.dart';
import 'package:toko_sm_delivery/Services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  // Login Model
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> kurirLogin({
    required String email,
    required String password,
  }) async {
    print("Login :  $email : $password");
    try {
      UserModel user = await AuthService().kurirLogin(
        email: email,
        password: password,
      );
      user.data.password = password;
      _user = user;
      saveLoginData(user);
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Set Login
  void saveLoginData(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data", jsonEncode(user));
  }

  void removeLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
  }

  // Get Login From SharedPref
  Future<UserModel?> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getData = prefs.getString("data");
    print("Kurir Data : ${getData}");
    if (getData != null) {
      var userData = jsonDecode(getData ?? "");
      UserModel login = UserModel.fromJson(userData);
      _user = login;
      return login;
    } else {
      return null;
    }
  }

  // Profile Model
  late UserModel _profile;

  UserModel get profile => _profile;

  set profile(UserModel profile) {
    _profile = profile;
    notifyListeners();
  }

  // Get Proflie
  Future<bool> kurirProfile({required String id}) async {
    print("Get Profile : Token ${_user.token}");
    try {
      UserModel profile =
          await AuthService().getProfile(id: id, token: _user.token!);
      _user.data = profile.data;
      saveLoginData(user);
      print("Get Profile : ${profile.toJson()}");
      return true;
    } catch (e) {
      print("Error profile : $e");
      return false;
    }
  }
}
