// To parse this JSON data, do
//
//     final sharedUserAttendanceAll = sharedUserAttendanceAllFromJson(jsonString);
import 'dart:convert';

SharedUserAttendanceAll sharedUserAttendanceAllFromJson(String str) =>
    SharedUserAttendanceAll.fromJson(json.decode(str));

String sharedUserAttendanceAllToJson(SharedUserAttendanceAll data) =>
    json.encode(data.toJson());

class SharedUserAttendanceAll {
  SharedUserAttendanceAll({
    required this.code,
    required this.data,
    required this.message,
  });

  final int code;
  final List<Datum> data;
  final String message;

  factory SharedUserAttendanceAll.fromJson(Map<String, dynamic> json) =>
      SharedUserAttendanceAll(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.userId,
    required this.fullName,
    required this.presentOnTime,
    required this.presentLate,
    required this.notPresent,
  });

  final int userId;
  final String fullName;
  final String presentOnTime;
  final String presentLate;
  final String notPresent;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        fullName: json["full_name"],
        presentOnTime: json["present_on_time"],
        presentLate: json["present_late"],
        notPresent: json["not_present"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "present_on_time": presentOnTime,
        "present_late": presentLate,
        "not_present": notPresent,
      };
}
