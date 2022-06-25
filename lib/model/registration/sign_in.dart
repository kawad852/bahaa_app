// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  bool? status;
  int? code;
  String? msg;
  Data? data;

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        status: json["status"],
        code: json["code"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.name,
    this.email,
    this.points,
    this.image,
  });

  String? name;
  String? email;
  int? points;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        points: json["points"],
        image: json["image"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "points": points,
        "image": image,
      };
}
