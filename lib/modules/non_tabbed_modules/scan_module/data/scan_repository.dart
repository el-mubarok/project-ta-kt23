import 'package:attendanceapp/shared/data/api_route.dart';
import 'package:attendanceapp/shared/models/shared_scanned_data_model.dart';
import 'package:attendanceapp/shared/utils/helper/helper_http.dart';
import 'package:attendanceapp/shared/utils/utils_global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ScanRepository {
  Future<SharedScannedData?> scanStart(String qrCode) async {
    Dio http = AppHelperHttp().http();
    String? userId = AppUtilsGlobal().userData.value?.data?.id.toString();
    String path = AppApiRoutes.pathScan;
    SharedScannedData? data;

    try {
      FormData postData = FormData.fromMap({
        "data": qrCode,
        "user_id": userId,
      });

      Response response = await http.post(
        path,
        data: postData,
      );

      if (kDebugMode) {
        print(response.data);
      }

      data = SharedScannedData.fromJson(response.data);

      if (data.code == 200 || data.code == 401) {
        return data;
      } else {
        return null;
      }
    } on DioError catch (err) {
      // http error
      if (kDebugMode) {
        print("scanStart(), http error at: $err");
      }
      return null;
    } catch (err) {
      // other error
      if (kDebugMode) {
        print("scanStart(), unknown error at: $err");
      }
      return null;
    }
  }
}
