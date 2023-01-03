import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLogin>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(LoginLoading());
        print('Form Validated Succesfully');
        if (email.text == 'user@gmail.com' && password.text == "User1234#") {
          emit(LoginSucces());
        } else {
          emit(LoginFailed('Login gagal, email atau password salah'));
        }
      }
    });
    on<SubmitPin>((event, emit) {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(LoginLoading());
        print('Form Validated Succesfully');
        if (pin.text.isNotEmpty && confirmPin.text.isNotEmpty) {
          emit(PinSucces());
        } else {
          emit(PinFailed('Harap isi form'));
        }
      }
    });
    on<ButtonLogin>((event, emit) {
      final loginValidate = email.text.isNotEmpty &&
          password.text.isNotEmpty &&
          formKey.currentState!.validate();
      final pinValidate = pin.text.isNotEmpty &&
          confirmPin.text.isNotEmpty &&
          formKey.currentState!.validate();
      final formValidate = loginValidate || pinValidate;
      emit(LoginButton(isEnableButton = formValidate));
    });
    on<ShowPassword>((event, emit) {
      print('pass : $showPass');
      emit(ShowPass(showPass = !showPass));
    });
    on<ShowPin>((event, emit) {
      print('pin : $showPin');
      emit(ShowPassAgain(showPin = !showPin));
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

  //filter emoji
  RegExp emoji = RegExp("[A-Za-z0-9@*#&]*");

  //filter email
  RegExp emailFormat = RegExp("[A-Z]*");

  //Login
  bool showPass = true;
  bool showPin = true;
  bool isEnableButton = false;
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  //Create PIN Evilz
  final pin = TextEditingController();
  final confirmPin = TextEditingController();
}
