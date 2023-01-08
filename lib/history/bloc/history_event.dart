part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class HistorySearchEvent extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class DariEvent extends HistoryEvent {
  @override
  List<Object> get props => [];
}

class SampaiEvent extends HistoryEvent {
  @override
  List<Object> get props => [];
}