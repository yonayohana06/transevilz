import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<SubmitTransfer>((event, emit) {
      // TODO: implement event handler
    });

    on<EventTransferButton>((event, emit) {
      final validate = amount.text.isNotEmpty &&
          noRek.text.isNotEmpty &&
          nameRecipient.text.isNotEmpty &&
          formKey.currentState!.validate();
      // final pinValidate = pin.text.isNotEmpty &&
      //     confirmPin.text.isNotEmpty &&
      //     formKey.currentState!.validate();
      // final formValidate = loginValidate || pinValidate;
      emit(StateTransferButton(isEnableButton = validate));
    });
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

  String? validate(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    return null;
  }

  final String feeAdmin = '5000';
  num total = 0;

  //Controller Transfer Page
  bool isEnableButton = false;
  final formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final noRek = TextEditingController();
  final nameRecipient = TextEditingController();
}
