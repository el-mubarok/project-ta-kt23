import 'package:attendanceapp/modules/non_tabbed_modules/scan_module/bloc/scan_bloc.dart';
import 'package:attendanceapp/modules/non_tabbed_modules/scan_module/data/scan_repository.dart';
import 'package:attendanceapp/shared/utils/helper/helper_common.dart';
import 'package:attendanceapp/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ModuleScan extends StatefulWidget {
  const ModuleScan({
    super.key,
    this.height = 0,
  });

  final double height;

  @override
  State<StatefulWidget> createState() => _ModuleScan();
}

class _ModuleScan extends State<ModuleScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isLoading = false;

  @override
  void reassemble() {
    super.reassemble();
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // } else if (Platform.isIOS) {
    //   controller!.resumeCamera();
    // }
    controller!.resumeCamera();
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      controller!.resumeCamera();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(
    BuildContext context,
    QRViewController controller,
  ) {
    this.controller = controller;
    // camera listener
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      //
      context.read<ScanBloc>().add(
            ScanEventStartScan(qrCode: result?.code),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScanBloc(
        repository: ScanRepository(),
      ),
      child: BlocConsumer<ScanBloc, ScanState>(
        listener: (_, state) {
          if (state is ScanStateLoading) {
            setState(() {
              isLoading = true;
            });
            controller!.pauseCamera();
          } else if (state is ScanStateScanned) {
            // scan succeeded
            setState(() {
              isLoading = false;
            });
            AppHelperCommon().showSnackBar(
              context,
              "Attendance recorded",
            );
            Navigator.pop(context);
          } else if (state is ScanStateScanFailed) {
            // scan failure
            setState(() {
              isLoading = false;
            });
            AppHelperCommon().showSnackBar(
              context,
              state.message ?? "Attendance failed, please try again",
            );

            if (state.message != null) {
              Navigator.pop(context);
            } else {
              controller!.resumeCamera();
            }
          }
        },
        builder: (context, state) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: QRView(
                      key: qrKey,
                      overlay: QrScannerOverlayShape(),
                      onQRViewCreated: (camController) {
                        _onQRViewCreated(context, camController);
                      },
                    ),
                  ),
                ),
                //
                // Positioned(
                //   child: Text(
                //     "Result: ${result != null ? result!.code : ''}",
                //     style: const TextStyle(
                //       color: AppColors.white,
                //     ),
                //   ),
                // ),
                //
                if (isLoading)
                  Positioned(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: AppColors.primary,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: const AlwaysStoppedAnimation(
                            AppColors.quartenary,
                          ),
                          strokeWidth: 8,
                          backgroundColor: AppColors.quartenary.withOpacity(
                            0.25,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
