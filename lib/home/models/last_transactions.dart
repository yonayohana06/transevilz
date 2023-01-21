class LastTrx {
  final String typeCurrency;
  final String bank;
  final String recipientRek;
  final num total;

  LastTrx({
    required this.typeCurrency,
    required this.bank,
    required this.recipientRek,
    required this.total,
  });

  factory LastTrx.fromJson(Map<String, dynamic> json) {
    return LastTrx(
      bank: json['bank'] as String,
      typeCurrency: json['type_currency'] as String,
      recipientRek: json['recipient_norek'] as String,
      total: json['total'] as num,
    );
  }
}
