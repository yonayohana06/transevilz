import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

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
          emit(TransferFailed('Gagal'));
        }
      }
    });

    on<EventInit>((event, emit) {
      emit(TransferLoading());
      total = event.total;
    });

    on<EventTransferButton>((event, emit) {
      final validate =
          amount.text.isNotEmpty && formKey.currentState!.validate();
      final validateRecipient = noRek.text.isNotEmpty &&
          nameRecipient.text.isNotEmpty &&
          formKey.currentState!.validate();
      // final pinValidate = pin.text.isNotEmpty &&
      //     confirmPin.text.isNotEmpty &&
      //     formKey.currentState!.validate();
      final formValidate = validateRecipient || validate;
      emit(StateTransferButton(isEnableButton = formValidate));
      amount.addListener(
        () {
          hitung();
        },
      );
      emit(StateTotal(total = total));
    });
  }

  void clearForm() {
    noRek.clear();
    nameRecipient.clear();
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

  String? validateNominal(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if (v.length < 5) {
      return 'Minimal transfer 10.000';
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

  final String feeAdmin = '5000';
  num total = 0;

  //Controller Transfer Page
  bool isEnableButton = false;
  final formKey = GlobalKey<FormState>();
  final amount = TextEditingController();
  final noRek = TextEditingController();
  final nameRecipient = TextEditingController();
}
