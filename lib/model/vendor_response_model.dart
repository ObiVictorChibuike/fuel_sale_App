// To parse this JSON data, do
//
//     final getAllVendorModelResponse = getAllVendorModelResponseFromJson(jsonString);

import 'dart:convert';

List<GetAllVendorModelResponse> getAllVendorModelResponseFromJson(String str) => List<GetAllVendorModelResponse>.from(json.decode(str).map((x) => GetAllVendorModelResponse.fromJson(x)));

String getAllVendorModelResponseToJson(List<GetAllVendorModelResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllVendorModelResponse {
  GetAllVendorModelResponse({
    required this.id,
    required this.category,
    required this.businessName,
    required this.region,
    required this.state,
    required this.city,
    required this.address,
    required this.email,
    required this.tel,
    required this.longitude,
    required this.latitude,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String category;
  String businessName;
  String region;
  String state;
  String city;
  String address;
  String email;
  String tel;
  double longitude;
  double latitude;
  Status? status;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetAllVendorModelResponse.fromJson(Map<String, dynamic> json) => GetAllVendorModelResponse(
    id: json["id"],
    category: json["category"],
    businessName: json["businessName"],
    region: json["region"],
    state: json["state"],
    city: json["city"],
    address: json["address"],
    email: json["email"],
    tel: json["tel"],
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    status: statusValues.map[json["status"]],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category,
    "businessName": businessName,
    "region": region,
    "state": state,
    "city": city,
    "address": address,
    "email": email,
    "tel": tel,
    "longitude": longitude,
    "latitude": latitude,
    "status": statusValues.reverse[status],
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

enum Status { ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

