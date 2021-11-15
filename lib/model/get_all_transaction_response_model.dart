// To parse this JSON data, do
//
//     final getAllTransactionModelResponse = getAllTransactionModelResponseFromJson(jsonString);

import 'dart:convert';

List<GetAllTransactionModelResponse> getAllTransactionModelResponseFromJson(String str) => List<GetAllTransactionModelResponse>.from(json.decode(str).map((x) => GetAllTransactionModelResponse.fromJson(x)));

String getAllTransactionModelResponseToJson(List<GetAllTransactionModelResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTransactionModelResponse {
  GetAllTransactionModelResponse({
    required this.id,
    required this.userId,
    required this.vendorId,
    required this.riderId,
    required this.cardId,
    required this.addressId,
    required this.transAmount,
    required this.unitprice,
    required this.quantity,
    required this.transCode,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int userId;
  int vendorId;
  int riderId;
  int cardId;
  int addressId;
  int transAmount;
  int unitprice;
  int quantity;
  String transCode;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetAllTransactionModelResponse.fromJson(Map<String, dynamic> json) => GetAllTransactionModelResponse(
    id: json["id"],
    userId: json["userId"],
    vendorId: json["vendorId"],
    riderId: json["riderId"],
    cardId: json["cardId"],
    addressId: json["addressId"],
    transAmount: json["transAmount"],
    unitprice: json["unitprice"],
    quantity: json["quantity"],
    transCode: json["transCode"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "vendorId": vendorId,
    "riderId": riderId,
    "cardId": cardId,
    "addressId": addressId,
    "transAmount": transAmount,
    "unitprice": unitprice,
    "quantity": quantity,
    "transCode": transCode,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
