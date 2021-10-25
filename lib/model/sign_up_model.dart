// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.firstname,
    required this.lastname,
    required this.tel,
    required this.email,
    required this.sex,
    required this.dob,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String firstname;
  String lastname;
  String tel;
  String email;
  String sex;
  DateTime dob;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstname: json["firstname"],
    lastname: json["lastname"],
    tel: json["tel"],
    email: json["email"],
    sex: json["sex"],
    dob: DateTime.parse(json["dob"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "tel": tel,
    "email": email,
    "sex": sex,
    "dob": dob.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
