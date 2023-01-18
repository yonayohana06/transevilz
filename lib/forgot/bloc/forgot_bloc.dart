import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

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
          emailToSend = email.text;
          emit(EmailSuccess());
          print("ini emailnya : ${email.text}");
        } else {
          emit(EmailFailed('Email belum terdaftar'));
        }
      }
    });

    on<SubmitNewPassword>((event, emit) async {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(ForgotLoading());
        print("email new: $emailToSend");
        const baseUrlJava = "http://103.152.119.157:5555/api/v1/new_password";
        const baseUrlExpress =
            "https://red-gifted-squid.cyclic.app/api/v1/new_password";
        final response = await http.put(Uri.parse(baseUrlExpress),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "password": newPass.text,
              "email": emailToSend,
            }));
        final output = jsonDecode(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          print(output);
          emit(NewPassSuccess());
        } else {
          emit(const NewPassFailed('Email tidak terdaftar'));
        }
      }
    });

    on<InitEmail>((event, emit) {
      print('email event : ${event.email}');
      emailToSend = event.email;
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

  String emailToSend = '';

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
