// To parse this JSON data, do
//
//     final sharedScannedData = sharedScannedDataFromJson(jsonString);
import 'dart:convert';

SharedScannedData sharedScannedDataFromJson(String str) =>
    SharedScannedData.fromJson(json.decode(str));

String sharedScannedDataToJson(SharedScannedData data) =>
    json.encode(data.toJson());

class SharedScannedData {
  SharedScannedData({
    required this.code,
    this.data,
    required this.message,
  });

  final int code;
  final Data? data;
  final String message;

  factory SharedScannedData.fromJson(Map<String, dynamic> json) =>
      SharedScannedData(
        code: json["code"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    required this.notification,
    required this.additionalData,
  });

  final Notification notification;
  final AdditionalData additionalData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notification: Notification.fromJson(json["notification"]),
        additionalData: AdditionalData.fromJson(json["additional_data"]),
      );

  Map<String, dynamic> toJson() => {
        "notification": notification.toJson(),
        "additional_data": additionalData.toJson(),
      };
}

class AdditionalData {
  AdditionalData({
    required this.qrCode,
    required this.presentOnTime,
    required this.presentLate,
    required this.created,
  });

  final String qrCode;
  final dynamic presentOnTime;
  final dynamic presentLate;
  final DateTime created;

  factory AdditionalData.fromJson(Map<String, dynamic> json) => AdditionalData(
        qrCode: json["qr_code"],
        presentOnTime: json["present_on_time"],
        presentLate: json["present_late"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "qr_code": qrCode,
        "present_on_time": presentOnTime,
        "present_late": presentLate,
        "created": created.toIso8601String(),
      };
}

class Notification {
  Notification({
    required this.id,
    required this.recipients,
    required this.externalId,
    required this.statusCode,
  });

  final String id;
  final int recipients;
  final dynamic externalId;
  final int statusCode;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        recipients: json["recipients"],
        externalId: json["external_id"],
        statusCode: json["_status_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "recipients": recipients,
        "external_id": externalId,
        "_status_code": statusCode,
      };
}
