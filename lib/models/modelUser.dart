import 'package:flutter/material.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? birthDay;
  String? companyName;
  String? departemnt;
  String? jobTile;
  String? phone;
  String? avatar;
  String? password;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.departemnt,
    required this.jobTile,
    required this.email,
    required this.avatar,
    required this.companyName,
    required this.birthDay,
    required this.password,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    email = json["email"];
    gender = json["gender"];
    birthDay = json["birthdate"];
    companyName = json["company_name"];
    departemnt = json["department"];
    jobTile = json["job_title"];
    phone = json["phone"];
    avatar = json["avatar"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "gender": gender,
      "birthdate": birthDay,
      "email": email,
      "company_name": companyName,
      "job_title": jobTile,
      "department": departemnt,
      "avatar": avatar,
      "phone": phone,
      "password": password,
    };
  }
}
