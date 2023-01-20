import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:transevilz/app/app.dart';

part 'forgot_pin_event.dart';
part 'forgot_pin_state.dart';

class ForgotPinBloc extends Bloc<ForgotPinEvent, ForgotPinState> {
  ForgotPinBloc() : super(ForgotPinInitial()) {
    on<SubmitEmailPin>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(ForgotPinLoading());
        if (email.text.isNotEmpty) {
          emailToSend = email.text;
          emit(ForgotPinSuccess());
          // print("ini emailnya : $emailToSend");
        } else {
          emit(const ForgotPinFailed('Email belum terdaftar'));
        }
      }
    });

    on<SubmitNewPin>((event, emit) async {
      final isValid = formKey.currentState!.validate();
      final newPin = int.parse(pin.text);
      if (isValid) {
        emit(ForgotPinLoading());
        // print("email new: $emailToSend");
        await repo.forgotPin(newPin).then((value) => statusCode = value);
        if (statusCode == 200) {
          emit(ForgotPinSuccess());
        } else {
          emit(const ForgotPinFailed('Gagal update pin'));
        }
      }
    });

    on<StatusButtonPin>((event, emit) {
      final emailValidate =
          email.text.isNotEmpty && formKey.currentState!.validate();
      final newPassValidate = pin.text.isNotEmpty &&
          confirmPin.text.isNotEmpty &&
          formKey.currentState!.validate();
      final formValidate = emailValidate || newPassValidate;
      emit(ButtonPinStatus(isEnableButton = formValidate));
    });

    on<ShowNewPin>((event, emit) {
      // print('pass : $showPass');
      emit(ShowPinStatus(showPin = !showPin));
    });

    on<ShowNewPinAgain>((event, emit) {
      // print('pass kedua : $showPassAgain');
      emit(ShowPinStatusAgain(showPinConfirm = !showPinConfirm));
    });
  }

  String? validateEmail(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(v)) {
      return 'Format email salah';
    }
    return null;
  }

  String? validatePin(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    } else if (v.length < 6) {
      return 'Terlalu pendek, kata sandi minimal 6 angka';
    }
    return null;
  }

  String? validateConfirmPin(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    } else if (v.length < 6) {
      return 'Terlalu pendek, minimal 6 karakter';
    } else if (v != pin.text) {
      return 'Pin tidak sama';
    }
    return null;
  }

  // variable api repository
  final repo = ApiRepository();
  final url = Constan.baseUrl;
  int statusCode = 0;

  String emailToSend = '';

  //filter emoji
  RegExp emoji = RegExp("[A-Za-z0-9@*#&]*");

  //filter email
  RegExp emailFormat = RegExp("[A-Z]*");

  bool showPin = true;
  bool showPinConfirm = true;
  bool isEnableButton = false;
  final formKey = GlobalKey<FormState>();

  //Controller Email Verification
  final email = TextEditingController();

  //Create PIN Evilz
  final pin = TextEditingController();
  final confirmPin = TextEditingController();
}
