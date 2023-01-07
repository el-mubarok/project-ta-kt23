import 'package:attendanceapp/config/routes/route_names.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/account_module/screens/account_screen.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/screens/home_screen.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/login_module/screens/login_screen.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/scan_module/screens/scan_screen.dart';
import 'package:attendanceapp/modules/tabs/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      //
      case NamedRoute.tab:
        return CupertinoPageRoute(
          builder: (_) => const Tabs(),
        );

      case NamedRoute.moduleSplash:
        return CupertinoPageRoute(
          builder: (_) => const Tabs(),
        );

      case NamedRoute.moduleLogin:
        return CupertinoPageRoute(
          builder: (_) => const ModuleLogin(),
        );

      case NamedRoute.moduleHome:
        return MaterialPageRoute(
          builder: (_) => const ModuleHome(),
        );

      case NamedRoute.moduleScan:
        return MaterialPageRoute(
          builder: (_) => const ModuleScan(),
        );

      case NamedRoute.moduleAccount:
        return MaterialPageRoute(
          builder: (_) => const ModuleAccount(),
        );

      // default page not found
      default:
        return CupertinoPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page is under development...'),
            ),
          ),
        );
    }
  }
}
