// ignore_for_file: file_names, unused_import, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, avoid_print

import 'dart:convert';

import 'package:car_shop/api/apiParameter.dart';
import 'package:car_shop/models/modelCar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CarApi {
  Future<List<CarModel>> getModel() async {
    var getDataApi = '${getApi}';
    var headers = {
      'Content-Type': 'application/json',
    };

    var responseBody = await http.get(Uri.parse(getDataApi), headers: headers);
    print(responseBody.body);

    if (responseBody.statusCode == 200) {
      List data = jsonDecode(responseBody.body)['cars'];

      List<CarModel> getCars = [];
      for (var item in data) {
        getCars.add(CarModel.fromJson(item));
      }
      return getCars;
    } else {
      throw Exception("Gagal get car");
    }
  }
}
