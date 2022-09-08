import 'package:flutter/material.dart';

class CarModel {
  late String id;
  late String car;
  late String carModel;
  late String carColor;
  late String carModelYear;
  late String carVin;
  late String price;

  CarModel({
    required this.id,
    required this.car,
    required this.carModel,
    required this.carColor,
    required this.carModelYear,
    required this.carVin,
    required this.price,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    car = json["car"];
    carModel = json['car_model'];
    carColor = json['car_color'];
    carModelYear = json['car_model_year'];
    carVin = json['car_vin'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "car": car,
      "car_model": carModel,
      "car_color": carColor,
      "car_model_year": carModelYear,
      "car_vin": carVin,
      "price": price,
    };
  }
}
