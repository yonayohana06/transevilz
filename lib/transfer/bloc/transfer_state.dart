part of 'transfer_bloc.dart';

abstract class TransferState extends Equatable {
  const TransferState();

  @override
  List<Object> get props => [];
}

class TransferInitial extends TransferState {}

class TransferSuccess extends TransferState {}

class RecipientSuccess extends TransferState {}

class PaymentSuccess extends TransferState {}

class TransferFailed extends TransferState {
  final String msg;

  const TransferFailed(this.msg);
  @override
  List<Object> get props => [msg];
}

class GetInvoiceFailed extends TransferState {
  final String msg;

  const GetInvoiceFailed(this.msg);
  @override
  List<Object> get props => [msg];
}

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

class StateInvoiceTrx extends TransferState {
  final InvoiceTrx invoices;

  const StateInvoiceTrx(this.invoices);
  @override
  List<Object> get props => [invoices];
}
