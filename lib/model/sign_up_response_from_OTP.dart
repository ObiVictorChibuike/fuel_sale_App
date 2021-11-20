// To parse this JSON data, do
//
//     final signUpResponseFromOtpValidation = signUpResponseFromOtpValidationFromJson(jsonString);

import 'dart:convert';

SignUpResponseFromOtpValidation signUpResponseFromOtpValidationFromJson(String str) => SignUpResponseFromOtpValidation.fromJson(json.decode(str));

String signUpResponseFromOtpValidationToJson(SignUpResponseFromOtpValidation data) => json.encode(data.toJson());

class SignUpResponseFromOtpValidation {
  SignUpResponseFromOtpValidation({
    required this.status,
    required this.message,
    required this.user,
    required this.token,
  });

  int status;
  String message;
  User user;
  String token;

  factory SignUpResponseFromOtpValidation.fromJson(Map<String, dynamic> json) => SignUpResponseFromOtpValidation(
    status: json["status"],
    message: json["message"],
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
