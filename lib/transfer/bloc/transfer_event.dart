part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class SubmitTransfer extends TransferEvent {}

class EventTransferButton extends TransferEvent {}
