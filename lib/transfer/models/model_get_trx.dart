class InvoiceTrx {
  final String id;
  final String recipient;
  final String senderName;
  final String senderEmail;
  final String bank;
  final String typeCurrency;
  final String typeTransaction;
  final String recipientRek;
  final String virtualAccount;
  final num total;
  final String status;
  final String trxDate;
  final String expired;

  InvoiceTrx({
    this.id = '',
    this.senderEmail = '',
    this.typeTransaction = '',
    this.status = '',
    this.trxDate = '',
    this.expired = '',
    required this.recipient,
    required this.senderName,
    required this.bank,
    required this.typeCurrency,
    required this.recipientRek,
    required this.virtualAccount,
    required this.total,
  });

  factory InvoiceTrx.fromJson(Map<String, dynamic> json) {
    return InvoiceTrx(
      id: json['id'] as String,
      senderEmail: json['sender_email'] as String,
      status: json['status'] as String,
      trxDate: json['transaction_date'] as String,
      expired: json['expired_at'] as String,
      recipient: json['recipient_name'] as String,
      senderName: json['sender_name'] as String,
      bank: json['bank'] as String,
      typeCurrency: json['type_currency'] as String,
      recipientRek: json['recipient_norek'] as String,
      virtualAccount: json['virtual_account'] as String,
      total: json['total'] as num,
    );
  }
}
