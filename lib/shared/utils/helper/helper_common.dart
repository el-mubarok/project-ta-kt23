import 'package:attendanceapp/shared/ui/widgets/widget_dialog.dart';
import 'package:attendanceapp/shared/ui/widgets/widget_input.dart';
import 'package:attendanceapp/shared/utils/helper/helper_device.dart';
import 'package:attendanceapp/shared/utils/utils_global.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class AppHelperCommon {
  showSnackBar(
    BuildContext context,
    String message, [
    int duration = 4,
  ]) {
    // close all active snackbar
    AppUtilsGlobal().snackbarKey.currentState?.clearSnackBars();
    //
    final snackBarContent = SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    );
    AppUtilsGlobal().snackbarKey.currentState?.showSnackBar(
          snackBarContent,
        );
  }

  showDeviceId(BuildContext context) async {
    String deviceId = "";
    TextEditingController text = TextEditingController();

    AppHelperDevice().getEncodedDeviceId().then((value) {
      deviceId = value;
      text.text = deviceId;
      print(deviceId);
    });
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrettyQr(
                  size: 200,
                  data: deviceId,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  roundEdges: true,
                ),
                //
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: WidgetInput(
                    hint: "My device ID",
                    textController: text,
                    type: TextInputType.text,
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showAlert({
    required BuildContext context,
    String? title,
    String? subtitle,
    String? content,
    VoidCallback? onTapOk,
    VoidCallback? onDismissed,
    bool okOnly = false,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WidgetDialog(
          title: title,
          subtitle: subtitle,
          content: content,
          okOnly: okOnly,
          onOk: () {
            onTapOk!();
          },
        );
      },
    ).then((value) {
      onDismissed!();
    });
  }

  String dateFormatterHistory(DateTime? date, [bool hoursOnly = false]) {
    var result = DateFormat("E, d LLL y").format(
      (date ?? DateTime.now()),
    );

    if (hoursOnly) {
      result = date != null ? DateFormat("HH:mm").format((date)) : '-';
    }

    return result;
  }
}
