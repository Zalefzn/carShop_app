import 'package:car_shop/api/carApi.dart';
import 'package:car_shop/models/modelCar.dart';
import 'package:flutter/material.dart';

class ProviderCar with ChangeNotifier {
  List<CarModel> _getCar = [];

  List<CarModel> get getCar => _getCar;

  set getCar(List<CarModel> car) {
    _getCar = car;
    notifyListeners();
  }

  Future<void> getCars() async {
    try {
      List<CarModel> car = await CarApi().getModel();

      _getCar = car;
    } catch (e) {
      print(e);
    }
  }
}
