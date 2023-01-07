import 'package:attendanceapp/modules/non_tabbed_modules/scan_module/data/scan_repository.dart';
import 'package:attendanceapp/shared/models/shared_scanned_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final ScanRepository repository;

  ScanBloc({
    required this.repository,
  }) : super(ScanInitial()) {
    on<ScanEventStartScan>(_scanEventStartScan);
  }

  void _scanEventStartScan(
    ScanEventStartScan event,
    Emitter<ScanState> emit,
  ) async {
    emit(ScanStateLoading());

    String? qrCode = event.qrCode;

    if (qrCode != null) {
      SharedScannedData? result = await repository.scanStart(
        qrCode,
      );

      if (result != null) {
        if (result.code == 401) {
          // already attended
          emit(const ScanStateScanFailed(
            message: "You already attended",
          ));
        } else {
          emit(ScanStateScanned());
        }
      } else {
        emit(const ScanStateScanFailed());
      }
    } else {
      // if qr null
      emit(const ScanStateScanFailed());
    }
  }
}
