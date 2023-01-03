import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotInitial()) {
    on<SubmitEmail>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(ForgotLoading());
        print('Form Validated Succesfully');
        if (email.text.isNotEmpty) {
          emit(EmailSuccess());
        } else {
          emit(EmailFailed('Email belum terdaftar'));
        }
      }
    });

    on<SubmitNewPassword>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(ForgotLoading());
        print('Form Validated Succesfully');
        if (newPass.text.isNotEmpty && newPassAgain.text.isNotEmpty) {
          emit(NewPassSuccess());
        } else {
          emit(NewPassFailed('Password gagal disimpan'));
        }
      }
    });

    on<StatusButton>((event, emit) {
      final emailValidate =
          email.text.isNotEmpty && formKey.currentState!.validate();
      final newPassValidate = newPass.text.isNotEmpty &&
          newPass.text.isNotEmpty &&
          formKey.currentState!.validate();
      final formValidate = emailValidate || newPassValidate;
      emit(ButtonStatus(buttonEnable = formValidate));
    });

    on<ShowNewPass>((event, emit) {
      print('pass : $showPass');
      emit(PassStatus(showPass = !showPass));
    });

    on<ShowNewPassAgain>((event, emit) {
      print('pass kedua : $showPassAgain');
      emit(PassStatusAgain(showPassAgain = !showPassAgain));
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

  String? validatePassword(String? v) {
    RegExp regex =
        RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[@#&*]).{8,}$');
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    } else if (v.length < 8) {
      return 'Terlalu pendek, kata sandi minimal 8 karakter';
    } else if (!regex.hasMatch(v)) {
      return "Kata sandi harus berisi huruf besar, angka\n"
          "dan simbol (@, *, #, &)";
    }
    return null;
  }

  String? validateConfirmPass(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    } else if (v.length < 8) {
      return 'Terlalu pendek, minimal 8 karakter';
    } else if (v != newPass.text) {
      return 'Pin tidak sama';
    }
    return null;
  }

  //filter emoji
  RegExp emoji = RegExp("[A-Za-z0-9@*#&]*");

  //filter email
  RegExp emailFormat = RegExp("[A-Z]*");

  bool buttonEnable = false;
  bool showPass = true;
  bool showPassAgain = true;

  final formKey = GlobalKey<FormState>();

  //Controller Email Verification
  final email = TextEditingController();

  //Controller New Password
  final newPass = TextEditingController();
  final newPassAgain = TextEditingController();
}
