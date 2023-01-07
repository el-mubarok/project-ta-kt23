// To parse this JSON data, do
//
//     final sharedUserData = sharedUserDataFromJson(jsonString);

import 'dart:convert';

SharedUserData sharedUserDataFromJson(String str) =>
    SharedUserData.fromJson(json.decode(str));

String sharedUserDataToJson(SharedUserData data) => json.encode(data.toJson());

class SharedUserData {
  SharedUserData({
    required this.code,
    required this.data,
    required this.message,
  });

  final int code;
  final Data? data;
  final String message;

  factory SharedUserData.fromJson(Map<String, dynamic> json) => SharedUserData(
        code: json["code"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        // ignore: prefer_null_aware_operators
        "data": data != null ? data?.toJson() : null,
        "message": message,
      };
}

class Data {
  Data({
    required this.id,
    required this.role,
    required this.fullName,
    required this.department,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String role;
  final String fullName;
  final int department;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        role: json["role"],
        fullName: json["full_name"],
        department: json["department"],
        username: json["username"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "full_name": fullName,
        "department": department,
        "username": username,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
