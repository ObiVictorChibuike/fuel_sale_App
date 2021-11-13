import 'dart:convert';

List<GetAllCardForAUserResponseModel> getAllCardForAUserResponseModelFromJson(String str) => List<GetAllCardForAUserResponseModel>.from(json.decode(str).map((x) => GetAllCardForAUserResponseModel.fromJson(x)));

String getAllCardForAUserResponseModelToJson(List<GetAllCardForAUserResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCardForAUserResponseModel {
  GetAllCardForAUserResponseModel({
    required this.id,
    required this.cardNumber,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String cardNumber;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;


  factory GetAllCardForAUserResponseModel.fromJson(Map<String, dynamic> json) => GetAllCardForAUserResponseModel(
    id: json["id"],
    cardNumber: json["cardNumber"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cardNumber": cardNumber,
    "userId": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

