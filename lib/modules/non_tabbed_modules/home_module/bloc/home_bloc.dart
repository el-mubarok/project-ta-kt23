// ignore: depend_on_referenced_packages
import 'package:attendanceapp/modules/non_tabbed_modules/home_module/data/home_repository.dart';
import 'package:attendanceapp/shared/models/shared_user_attendance_month_model.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({
    required this.repository,
  }) : super(HomeInitial()) {
    on<HomeEventInitData>(_homeEventInitData);
  }

  void _homeEventInitData(
    HomeEventInitData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeStateLoading());

    // await Future.delayed(const Duration(seconds: 2));

    SharedUserAttendanceMonth? data =
        await repository.getUserAttendanceSummary();

    emit(HomeStateDataLoaded(userAttendanceSummary: data));
  }
}
