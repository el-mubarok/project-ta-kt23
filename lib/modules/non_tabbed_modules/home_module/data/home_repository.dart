import 'package:attendanceapp/shared/data/api_route.dart';
import 'package:attendanceapp/shared/models/shared_user_attendance_month_model.dart';
import 'package:attendanceapp/shared/utils/helper/helper_http.dart';
import 'package:attendanceapp/shared/utils/utils_global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HomeRepository {
  Future<SharedUserAttendanceMonth?> getUserAttendanceSummary() async {
    Dio http = AppHelperHttp().http();
    String? userId = AppUtilsGlobal().userData.value?.data?.id.toString();
    String path = AppApiRoutes.pathUserAttendanceSummary;
    SharedUserAttendanceMonth? data;

    print(path);

    try {
      Response response = await http.get(
        path,
        queryParameters: {
          "user_id": userId,
        },
      );

      data = SharedUserAttendanceMonth.fromJson(
        response.data,
      );

      if (data.code == 200) {
        return data;
      } else {
        return null;
      }
    } on DioError catch (err) {
      // http error
      if (kDebugMode) {
        print("getUserAttendanceSummary(): http error at: $err");
      }
      return null;
    } catch (err) {
      // unknown error
      if (kDebugMode) {
        print("getUserAttendanceSummary(): unknown error at: $err");
      }
      return null;
    }
  }
}
