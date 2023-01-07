import 'package:attendanceapp/config/routes/route_names.dart';
import 'package:attendanceapp/config/routes/routes.dart';
import 'package:attendanceapp/shared/utils/utils_global.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const MyApp myApp = MyApp();
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: AppUtilsGlobal().snackbarKey,
      onGenerateRoute: Routes.generatedRoute,
      initialRoute: NamedRoute.moduleLogin,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondary,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: AppColors.primary,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondary,
        ),
      ),
    );
  }
}
