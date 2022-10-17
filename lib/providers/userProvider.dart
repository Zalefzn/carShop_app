import 'package:car_shop/api/userApi.dart';
import 'package:car_shop/models/modelUser.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> _userModel = [];

  List<UserModel> get users => _userModel;

  set users(List<UserModel> user) {
    _userModel = user;
    notifyListeners();
  }

  Future<void> getUsers() async {
    try {
      List<UserModel> getUsers = await UserApi().getUser();
      _userModel = getUsers;
    } catch (e) {
      print(e);
    }
  }
}
