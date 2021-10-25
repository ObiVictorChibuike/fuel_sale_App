// class CreateUserRequestModel {
//   String? email;
//   String? password;
//
//   CreateUserRequestModel({this.email, this.password});
//
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//       'email': email!.trim(),
//       'password': password!.trim(),
//     };
//     return map;
//   }
// }
//
// class LoginResponse {
//   String? token;
//   LoginResponse(this.token,);
//
//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     token = json["token"]as String;
//   }
// }

// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.token,
  });

  String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
