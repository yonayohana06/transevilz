part of 'transfer_bloc.dart';

abstract class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object> get props => [];
}

class TransferInitial extends TransferState {}

class TransferSuccess extends TransferState {}

class TransferFailed extends TransferState {}

class TransferLoading extends TransferState {}

class StateTransferButton extends TransferState {
  final bool status;

  const StateTransferButton(this.status);
  @override
  List<Object> get props => [status];
}

class StateTotal extends TransferState {
  final num total;

  const StateTotal(this.total);
  @override
  List<Object> get props => [total];
}
