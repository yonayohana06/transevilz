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
  final bool isExpired;

  InvoiceTrx({
    required this.id,
    required this.senderEmail,
    required this.typeTransaction,
    required this.status,
    required this.trxDate,
    required this.expired,
    required this.isExpired,
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
      typeTransaction: json['type_transaction'],
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
      isExpired: json['isExpired'] as bool,
    );
  }
}
