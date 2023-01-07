class AppApiRoutes {
  static const baseEndpoint = 'http://192.168.43.21';
  // static const baseEndpoint = 'https://squidwarestudio.com/@dev/kt23/api.php';
  static const apiEndpoint =
      '$baseEndpoint/projects/TA/attendence_app/api.php?';
  // static const apiEndpoint = '$baseEndpoint/api.php?';
  //
  // Login
  // POST
  // params: username, password, device_id, role
  static const pathLogin = '${apiEndpoint}login=true';
  // Scan
  // POST
  // params: data, user_id
  static const pathScan = '${apiEndpoint}scan=true';
}
