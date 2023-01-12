import 'package:attendanceapp/modules/non_tabbed_modules/history_module/data/history_repository.dart';
import 'package:attendanceapp/shared/models/shared_user_attendance_month_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository repository;

  HistoryBloc({
    required this.repository,
  }) : super(HistoryInitial()) {
    on<HistoryEventInitData>(_historyEventInitData);
  }

  void _historyEventInitData(
    HistoryEventInitData event,
    Emitter<HistoryState> emit,
  ) async {
    emit(HistoryStateLoading());

    SharedUserAttendanceMonth? data =
        await repository.getUserAttendanceSummaryAll();

    emit(
      HistoryStateDataLoaded(
        userAttendanceSummary: data,
      ),
    );
  }
}
