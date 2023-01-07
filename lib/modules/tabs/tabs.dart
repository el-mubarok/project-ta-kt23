import 'package:attendanceapp/modules/tabbed_modules/tab_home/tab_home.dart';
import 'package:attendanceapp/modules/tabbed_modules/tab_account/tab_account.dart';
import 'package:attendanceapp/modules/tabbed_modules/tab_scan/tab_scan.dart';
import 'package:attendanceapp/modules/tabs/tab_bar.dart';
import 'package:attendanceapp/shared/ui/widgets/widget_tabbed_page_wrapper.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<StatefulWidget> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return WidgetTabbedPageWrapper(
      bottomBar: ComponentTabBar(
        position: position,
        onChange: (v) {
          setState(() {
            position = v;
          });
        },
      ),
      scrollable: false,
      child: Container(
        color: AppColors.white,
        child: IndexedStack(
          index: position,
          children: const <Widget>[
            PageTabHome(),
            PageTabScan(),
            PageTabAccount(),
          ],
        ),
      ),
    );
  }
}
