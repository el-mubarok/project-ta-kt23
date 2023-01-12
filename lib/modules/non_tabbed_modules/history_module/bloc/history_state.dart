part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object?> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryStateLoading extends HistoryState {}

class HistoryStateDataLoaded extends HistoryState {
  final SharedUserAttendanceMonth? userAttendanceSummary;

  const HistoryStateDataLoaded({
    required this.userAttendanceSummary,
  });

  @override
  List<Object?> get props => [userAttendanceSummary];
}
