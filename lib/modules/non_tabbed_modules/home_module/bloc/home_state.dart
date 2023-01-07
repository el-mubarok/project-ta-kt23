part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateDataLoaded extends HomeState {
  final SharedUserAttendanceAll? userAttendanceSummary;

  const HomeStateDataLoaded({
    required this.userAttendanceSummary,
  });

  @override
  List<Object?> get props => [
        userAttendanceSummary,
      ];
}
