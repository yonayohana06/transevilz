class HistoryTrans {
  String? recipient_name;
  String? sender_name;
  String? bank;
  String? type_currency;
  String? type_transaction;
  String? recipient_norek;
  String? virtual_account;
  int? total;
  int? nominal;
  String? status;
  int? admin_fee;
  String? swift_number;
  String? transaction_date;
  String? expired_at;
  bool? isExpired;

  HistoryTrans({
    this.recipient_name,
    this.sender_name,
    this.bank,
    this.type_currency,
    this.type_transaction,
    this.recipient_norek,
    this.virtual_account,
    this.total,
    this.nominal,
    this.status,
    this.admin_fee,
    this.swift_number,
    this.transaction_date,
    this.expired_at,
    this.isExpired
  });

  HistoryTrans.fromJson(Map<String, dynamic> json) {
    recipient_name = json['recipient_name'];
    sender_name = json['sender_name'];
    bank = json['bank'];
    type_currency = json['type_currency'];
    type_transaction = json['type_transaction'];
    recipient_norek = json['recipient_norek'];
    virtual_account = json['virtual_account'];
    total = json['total'];
    nominal = json['nominal'];
    status = json['status'];
    admin_fee = json['admin_fee'];
    swift_number = json['swift_number'];
    transaction_date = json['transaction_date'];
    expired_at = json['expired_at'];
    isExpired = json['isExpired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipient_name'] = recipient_name;
    data['sender_name'] = sender_name;
    data['bank'] = bank;
    data['type_currency'] = type_currency;
    data['type_transaction'] = type_transaction;
    data['recipient_norek'] = recipient_norek;
    data['virtual_account'] = virtual_account;
    data['total'] = total;
    data['nominal'] = nominal;
    data['status'] = status;
    data['admin_fee'] = admin_fee;
    data['swift_number'] = swift_number;
    data['transaction_date'] = transaction_date;
    data['expired_at'] = expired_at;
    data['isExpired'] = isExpired;
    return data;
  }
}