class AppApiRoutes {
  // static const baseEndpoint = 'http://192.168.43.21';
  // static const baseEndpoint = 'https://squidwarestudio.com/@dev/kt23/api.php';
  static const baseEndpoint = 'http://ish-hrd.online/api.php';
  // static const apiEndpoint =
  //     '$baseEndpoint/projects/TA/attendence_app/api.php?';
  static const apiEndpoint = '$baseEndpoint/api.php?';
  //
  // Login
  // POST
  // params: username, password, device_id, role
  static const pathLogin = '${apiEndpoint}login=true';
  // Scan
  // POST
  // params: data, user_id
  static const pathScan = '${apiEndpoint}scan=true';
  // User attendance sumamry (current month)
  // GET
  // params: user_id
  static const pathUserAttendanceSummary = '${apiEndpoint}attendance_info=true';
  // User attendance sumamry (all)
  // GET
  // params: user_id
  static const pathUserAttendanceSummaryAll =
      '${apiEndpoint}attendance_info=true&all=true';
  // User detail
  // GET
  // params: user_id
  static const pathUserDetail = '${apiEndpoint}user_detail=true';
  // Reset user password
  // POST
  // params: user_id, password, device_id
  static const pathResetPassword = '${apiEndpoint}reset_password=true';
}
