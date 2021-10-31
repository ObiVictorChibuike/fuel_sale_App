// To parse this JSON data, do
//
//     final addCardResponseModel = addCardResponseModelFromJson(jsonString);

import 'dart:convert';

AddCardResponseModel addCardResponseModelFromJson(String str) => AddCardResponseModel.fromJson(json.decode(str));

String addCardResponseModelToJson(AddCardResponseModel data) => json.encode(data.toJson());

class AddCardResponseModel {
  AddCardResponseModel({
    required this.card,
  });

  Card card;

  factory AddCardResponseModel.fromJson(Map<String, dynamic> json) => AddCardResponseModel(
    card: Card.fromJson(json["card"]),
  );

  Map<String, dynamic> toJson() => {
    "card": card.toJson(),
  };
}

class Card {
  Card({
    required this.cardtype,
    required this.cardName,
    required this.cardNumber,
    required this.expiryDate,
    required this.userId,
    required this.vendorId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String cardtype;
  String cardName;
  String cardNumber;
  DateTime expiryDate;
  int userId;
  String vendorId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    cardtype: json["cardtype"],
    cardName: json["cardName"],
    cardNumber: json["cardNumber"],
    expiryDate: DateTime.parse(json["expiryDate"]),
    userId: json["userId"],
    vendorId: json["vendorId"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "cardtype": cardtype,
    "cardName": cardName,
    "cardNumber": cardNumber,
    "expiryDate": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
    "userId": userId,
    "vendorId": vendorId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
