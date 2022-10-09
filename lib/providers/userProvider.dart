import 'package:car_shop/api/userApi.dart';
import 'package:car_shop/models/modelUser.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final List<UserModel> _userModel = [];

  List<UserModel> get users => _userModel;

  set user(List<UserModel> user) {
    notifyListeners();
  }

  Future<void> getUsers() async {
    try {
      List<UserModel> getUsers = await UserApi().getUser();
    } catch (e) {
      print(e);
    }
  }
}
