part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryEventInitData extends HistoryEvent {
  const HistoryEventInitData();

  @override
  List<Object> get props => [];
}
