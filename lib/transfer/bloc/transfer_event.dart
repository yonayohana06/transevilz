part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class SubmitTransfer extends TransferEvent {}

class EventInit extends TransferEvent {
  final num total;

  const EventInit(this.total);
  @override
  List<Object> get props => [total];
}

class EventTransferButton extends TransferEvent {}

class EventClearButton extends TransferEvent {}
