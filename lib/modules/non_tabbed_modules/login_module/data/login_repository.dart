import 'package:attendanceapp/config/constants.dart';
import 'package:attendanceapp/shared/data/api_route.dart';
import 'package:attendanceapp/shared/models/shared_user_data_model.dart';
import 'package:attendanceapp/shared/utils/helper/helper_device.dart';
import 'package:attendanceapp/shared/utils/helper/helper_http.dart';
import 'package:attendanceapp/shared/utils/helper/helper_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoginRepository {
  Future<SharedUserData?> submitLogin(String username, String password) async {
    Dio http = AppHelperHttp().http();
    String path = AppApiRoutes.pathLogin;
    String deviceId = await AppHelperDevice().getEncodedDeviceId();
    String role = "user";
    SharedUserData? data;

    try {
      FormData postData = FormData.fromMap({
        "username": username,
        "password": password,
        "device_id": deviceId,
        "role": role,
      });

      if (kDebugMode) {
        print({
          "username": username,
          "password": password,
          "device_id": deviceId,
          "role": role,
        });
      }

      Response response = await http.post(
        path,
        data: postData,
      );
      data = SharedUserData.fromJson(response.data);

      if (data.code == 200) {
        return data;
      } else {
        return null;
      }
    } on DioError catch (err) {
      // http error
      /**
       * code:
       * 402 -> wrong password
       * 403 -> wrong username/password
       * 404 -> max attempt reached
       */
      if (kDebugMode) {
        print("submitLogin(): http error at: $err");
      }
      data = SharedUserData.fromJson(err.response?.data);
      return data;
    } catch (err) {
      // unknown error
      if (kDebugMode) {
        print("submitLogin(): unknwon error at: $err");
      }
      return null;
    }
  }

  Future<bool> checkIsLoggedIn() async {
    bool isExists = await AppHelperStorage().checkIsExists(
      AppConfigConstant.sessionUserData,
    );

    if (isExists) {
      // load userdata to active state
      await AppHelperStorage().loadUserDataToState();
    }

    return isExists;
  }
}
