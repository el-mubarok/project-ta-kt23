// To parse this JSON data, do
//
//     final sharedUserAttendanceMonth = sharedUserAttendanceMonthFromJson(jsonString);
import 'dart:convert';

SharedUserAttendanceMonth? sharedUserAttendanceMonthFromJson(String str) =>
    SharedUserAttendanceMonth.fromJson(json.decode(str));

String sharedUserAttendanceMonthToJson(SharedUserAttendanceMonth? data) =>
    json.encode(data!.toJson());

class SharedUserAttendanceMonth {
  SharedUserAttendanceMonth({
    required this.code,
    required this.data,
    required this.message,
  });

  final int? code;
  final List<Datum?>? data;
  final String? message;

  factory SharedUserAttendanceMonth.fromJson(Map<String, dynamic> json) =>
      SharedUserAttendanceMonth(
        code: int.parse(json["code"].toString()),
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.userId,
    required this.fullName,
    required this.sessionId,
    required this.sessionDate,
    required this.presentOnTime,
    required this.presentLate,
    required this.notPresent,
    required this.presentOutAt,
  });

  final int? userId;
  final String? fullName;
  final int? sessionId;
  final DateTime? sessionDate;
  final String? presentOnTime;
  final String? presentLate;
  final String? notPresent;
  final DateTime? presentOutAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: int.parse(json["user_id"].toString()),
        fullName: json["full_name"],
        sessionId: int.parse(json["session_id"].toString()),
        sessionDate: DateTime.parse(json["session_date"]),
        presentOnTime: json["present_on_time"],
        presentLate: json["present_late"],
        notPresent: json["not_present"],
        presentOutAt: json["present_out_at"] != null
            ? DateTime.parse(json["present_out_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "full_name": fullName,
        "session_id": sessionId,
        "session_date": sessionDate?.toIso8601String(),
        "present_on_time": presentOnTime,
        "present_late": presentLate,
        "not_present": notPresent,
        "present_out_at": presentOutAt?.toIso8601String(),
      };
}
