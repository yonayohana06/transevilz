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

class InvoiceTrxLoaded extends TransferState {
  final InvoiceTrx invoices;

  const InvoiceTrxLoaded(this.invoices);
  @override
  List<Object> get props => [invoices];
}

class DataBankLoaded extends TransferState {
  final List<Bank> bank;

  const DataBankLoaded(this.bank);
  @override
  List<Object> get props => [bank];
}

class GetBankSuccess extends TransferState {}

class GetBankFailed extends TransferState {
  final String msg;

  const GetBankFailed(this.msg);
  @override
  List<Object> get props => [msg];
}
