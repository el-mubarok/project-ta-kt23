import 'package:attendanceapp/shared/models/shared_user_data_model.dart';
import 'package:flutter/material.dart';

class AppUtilsGlobal {
  static final AppUtilsGlobal instance = AppUtilsGlobal.internal();
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  factory AppUtilsGlobal() => instance;

  AppUtilsGlobal.internal();

  final darkMode = ValueNotifier<bool>(false);
  final userData = ValueNotifier<SharedUserData?>(null);
}
