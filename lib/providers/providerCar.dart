import 'package:car_shop/api/carApi.dart';
import 'package:car_shop/models/modelCar.dart';
import 'package:flutter/material.dart';

class ProviderCar with ChangeNotifier {
  final List<CarModel> _getCar = [];

  List<CarModel> get cars => _getCar;

  set cars(List<CarModel> car) {
    notifyListeners();
  }

  Future<void> getCars() async {
    try {
      List<CarModel> carModel = await CarApi().getModel();
    } catch (e) {
      print(e);
    }
  }
}
