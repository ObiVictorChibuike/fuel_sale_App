// To parse this JSON data, do
//
//     final getUserDetailsModelResponse = getUserDetailsModelResponseFromJson(jsonString);

import 'dart:convert';

GetUserDetailsModelResponse getUserDetailsModelResponseFromJson(String str) => GetUserDetailsModelResponse.fromJson(json.decode(str));

String getUserDetailsModelResponseToJson(GetUserDetailsModelResponse data) => json.encode(data.toJson());

class GetUserDetailsModelResponse {
  GetUserDetailsModelResponse({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.tel,
    required this.email,
    required this.sex,
    required this.dob,
    required this.status,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstname;
  String lastname;
  String tel;
  String email;
  String sex;
  DateTime dob;
  int status;
  dynamic emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetUserDetailsModelResponse.fromJson(Map<String, dynamic> json) => GetUserDetailsModelResponse(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    tel: json["tel"],
    email: json["email"],
    sex: json["sex"],
    dob: DateTime.parse(json["dob"]),
    status: json["status"],
    emailVerifiedAt: json["email_verified_at"],
    twoFactorSecret: json["two_factor_secret"],
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "tel": tel,
    "email": email,
    "sex": sex,
    "dob": dob.toIso8601String(),
    "status": status,
    "email_verified_at": emailVerifiedAt,
    "two_factor_secret": twoFactorSecret,
    "two_factor_recovery_codes": twoFactorRecoveryCodes,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}