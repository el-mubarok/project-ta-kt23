part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();

  @override
  List<Object?> get props => [];
}

class ScanEventStartScan extends ScanEvent {
  final String? qrCode;

  const ScanEventStartScan({
    this.qrCode,
  });

  @override
  List<Object?> get props => [qrCode];
}
