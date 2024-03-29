// ignore_for_file: file_names, unused_import, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:car_shop/api/apiParameter.dart';
import 'package:car_shop/models/modelUser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<List<UserModel>> getUser() async {
    var getUsers = '${getApiUser}';
    var headers = {
      'Content-Type': 'application/json',
    };

    var responseBody = await http.get(Uri.parse(getUsers), headers: headers);
    print(responseBody.body);

    List<UserModel> getDatUser = [];
    if (responseBody.statusCode == 200) {
      List datUser = jsonDecode(responseBody.body)['Users'];
      for (var item in datUser) {
        getDatUser.add(UserModel.fromJson(item));
      }
      return getDatUser;
    } else {
      throw Exception("Gagal get User");
    }
  }
}
