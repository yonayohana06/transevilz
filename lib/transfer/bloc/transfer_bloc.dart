import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transevilz/transfer/transfer.dart';
import 'package:url_launcher/url_launcher.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<SubmitTransfer>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(TransferLoading());
        if (amount.text.isNotEmpty) {
          emit(TransferSuccess());
        } else {
          emit(const TransferFailed('Gagal'));
        }
      }
    });

    on<SubmitPaymentMethod>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(TransferLoading());
        if (paymentBank.text.isNotEmpty) {
          emit(PaymentSuccess());
        } else {
          emit(const TransferFailed('Gagal'));
        }
      }
    });

    on<SubmitRecipient>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(TransferLoading());
        final dataRecipient = destinationBank.text.isNotEmpty &&
            noRek.text.isNotEmpty &&
            nameRecipient.text.isNotEmpty;
        if (dataRecipient) {
          emit(RecipientSuccess());
        } else {
          emit(const TransferFailed('Gagal'));
        }
      }
    });

    on<EventInit>((event, emit) {
      emit(TransferLoading());
      total = event.total;
    });

    on<EventInitRecipient>((event, emit) {
      emit(TransferLoading());
      total = event.total;
      recipientBank = event.destinationBank;
      recipientRek = event.noRekening;
      recipientName = event.nama;
    });

    on<EventSearchRek>((event, emit) {
      // print(event.keyword.toString());
      final dataAll = dataRek.map<DataRek>((e) => DataRek.fromJson(e)).toList();
      // print(dataAll.length);
      final searchData =
          dataAll.where((element) => element.rek == event.keyword);
      if (searchData.isNotEmpty) {
        final namefound = searchData.first;
        nameRecipient.text = namefound.name;
      } else {
        nameRecipient.text = '';
      }
    });

    on<EventTransferButton>((event, emit) {
      final validate =
          amount.text.isNotEmpty && formKey.currentState!.validate();
      final validatePayment =
          paymentBank.text.isNotEmpty && formKey.currentState!.validate();
      final validateRecipient = noRek.text.isNotEmpty &&
          nameRecipient.text.isNotEmpty &&
          destinationBank.text.isNotEmpty &&
          formKey.currentState!.validate();
      final validateRecipientInter = noRek.text.isNotEmpty &&
          nameRecipient.text.isNotEmpty &&
          destinationBank.text.isNotEmpty &&
          kodeSwift.text.isNotEmpty &&
          formKey.currentState!.validate();
      // final pinValidate = pin.text.isNotEmpty &&
      //     confirmPin.text.isNotEmpty &&
      //     formKey.currentState!.validate();
      final formValidate = validateRecipient ||
          validate ||
          validateRecipientInter ||
          validatePayment;
      emit(StateTransferButton(isEnableButton = formValidate));
      amount.addListener(
        () {
          // hitung();
          if (event.type == TypeTransaction.local) {
            hitung();
          }
          if (event.type == TypeTransaction.international) {
            hitungInter();
          }
        },
      );
      emit(StateTotal(total = total));
      // print(total.toString());
    });
  }

  void clearForm() {
    noRek.clear();
    nameRecipient.clear();
    destinationBank.clear();
    kodeSwift.clear();
  }

  void hitung() {
    if (amount.text.isNotEmpty) {
      num count = int.parse(amount.text) + int.parse(feeAdmin);
      total = count;
    }
    if (amount.text.isEmpty) {
      total = 0;
    }
  }

  void hitungInter() {
    if (amount.text.isNotEmpty) {
      num count = int.parse(amount.text) + int.parse(adminInter);
      num exchange = int.parse(amount.text) / 15000;
      total = count;
      amountUSD.text = exchange.toStringAsFixed(1);
    }
    if (amount.text.isEmpty) {
      total = 0;
      amountUSD.text = '';
    }
  }

  void launchURL() async {
    const url = 'https://www.transfez.com/swift-codes/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  final dataRek = [
    {"rek": '9000877724254', "name": "Monalisa"},
    {"rek": '9000877724253', "name": "Rina"},
  ];

  String? validateNominal(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if (v.length < 5) {
      return 'Minimal transfer 10.000';
    }
    return null;
  }

  String? validateInter(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if (v.length < 6) {
      return 'Minimal transfer 100.000';
    }
    return null;
  }

  String? validateNoRek(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    // if (v.length < 5) {
    //   return 'Minimal transfer 10.000';
    // }
    return null;
  }

  //enum for type transfer
  TypeTransaction? type;

  // final String? type;
  final String feeAdmin = '5000';
  final String adminInter = '100000';
  num total = 0;

  //data recipient
  String recipientBank = '';
  String recipientRek = '';
  String recipientName = '';

  //Controller Transfer Page
  bool isEnableButton = false;
  final formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final amountUSD = TextEditingController();
  final noRek = TextEditingController();
  final nameRecipient = TextEditingController();
  final destinationBank = TextEditingController();
  final paymentBank = TextEditingController();
  final metodBank = TextEditingController();
  final kodeSwift = TextEditingController();
}

enum TypeTransaction {
  local,
  international,
}
