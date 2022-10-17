import 'package:car_shop/models/modelCar.dart';
import 'package:flutter/material.dart';

class WishListProvider with ChangeNotifier {
  List<CarModel> _carModel = [];

  List<CarModel> get wishList => _carModel;

  set wishList(List<CarModel> wishLists) {
    _carModel = wishLists;
    notifyListeners();
  }

  setProductCar(CarModel modelCar) {
    if (!isWishlist(modelCar)) {
      _carModel.add(modelCar);
    } else {
      _carModel.removeWhere((element) => element.id == modelCar.id);
    }

    notifyListeners();
  }

  isWishlist(CarModel modelCar) {
    if (_carModel.indexWhere((element) => element.id == modelCar.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
