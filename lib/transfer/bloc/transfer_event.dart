part of 'transfer_bloc.dart';

abstract class TransferEvent extends Equatable {
  const TransferEvent();

  @override
  List<Object> get props => [];
}

class SubmitTransfer extends TransferEvent {}

class SubmitRecipient extends TransferEvent {}

class SubmitPaymentMethod extends TransferEvent {}

class SubmitAllDataTrx extends TransferEvent {}

class SubmitInvoiceTrx extends TransferEvent {}

class EventInit extends TransferEvent {
  final num total;

  const EventInit(
    this.total,
  );
  @override
  List<Object> get props => [total];
}

class EventInitRecipient extends TransferEvent {
  final num total;
  final String destinationBank;
  final String noRekening;
  final String nama;

  const EventInitRecipient(
    this.total,
    this.destinationBank,
    this.noRekening,
    this.nama,
  );
  @override
  List<Object> get props => [
        total,
        destinationBank,
        noRekening,
        nama,
      ];
}

class EventSearchRek extends TransferEvent {
  final String keyword;

  const EventSearchRek(this.keyword);
  @override
  List<Object> get props => [keyword];
}

class EventTransferButton extends TransferEvent {
  final TypeTransaction type;

  const EventTransferButton(this.type);
  @override
  List<Object> get props => [type];
}

class EventClearButton extends TransferEvent {}
