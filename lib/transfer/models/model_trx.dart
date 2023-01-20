class DataTransaction {
  final String pin;
  final String rek;
  final String bankCode;
  final String amount;

  DataTransaction({
    required this.pin,
    required this.rek,
    required this.bankCode,
    required this.amount,
  });

  factory DataTransaction.fromJson(Map<String, dynamic> json) {
    return DataTransaction(
      pin: json['pin'].toString(),
      rek: json['no_rekening'].toString(),
      bankCode: json['bank_code'].toString(),
      amount: json['nominal'].toString(),
    );
  }
}
