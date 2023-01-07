part of 'scan_bloc.dart';

abstract class ScanState extends Equatable {
  const ScanState();

  @override
  List<Object?> get props => [];
}

class ScanInitial extends ScanState {}

class ScanStateLoading extends ScanState {}

class ScanStateScanned extends ScanState {
  @override
  List<Object?> get props => [];
}

class ScanStateScanFailed extends ScanState {
  final String? message;

  const ScanStateScanFailed({this.message});

  @override
  List<Object?> get props => [message];
}
