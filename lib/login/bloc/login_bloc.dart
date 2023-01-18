import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transevilz/app/helpers/helpers_prefs.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SubmitLogin>((event, emit) async {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(LoginLoading());
        // print('Form Validated Succesfully');
        const baseUrlJava = "http://103.152.119.157:5555/api/v1/login";
        const baseUrlExpress =
            "https://red-gifted-squid.cyclic.app/api/v1/login";
        final response = await http.post(Uri.parse(baseUrlExpress),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "email": email.text,
              "password": password.text,
            }));
        final output = jsonDecode(response.body);
        final users = output["user"];
        final token = output["accessToken"];
        if (response.statusCode == 200) {
          final pinUsr = users["userPin"];
          print(output);
          print(token);
          print(pinUsr);
          Helpers.setUserData(users['fullname']);
          Helpers.setToken(token);
          Helpers.setUsrPin(pinUsr);
          emit(LoginSucces());
        } else {
          emit(const LoginFailed('Email tidak terdaftar'));
        }
      }
    });
    on<SubmitPin>((event, emit) async {
      final isValid = formKey.currentState!.validate();
      if (isValid) {
        emit(LoginLoading());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('token');
        int noPin = int.parse(pin.text);
        const baseUrlJava = "http://103.152.119.157:5555/api/v1/login";
        const baseUrlExpress = "https://red-gifted-squid.cyclic.app/api/v1/pin";
        final response = await http.post(Uri.parse(baseUrlExpress),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "pin": noPin,
            }));
        final output = jsonDecode(response.body);
        if (response.statusCode == 201) {
          print(output);
          print(response);
          Helpers.setUsrPin(true);
          emit(PinSucces());
        } else {
          emit(const PinFailed('Pin sudah dibuat'));
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
      // print('pass : $showPass');
      emit(ShowPass(showPass = !showPass));
    });
    on<ShowPin>((event, emit) {
      // print('pin : $showPin');
      emit(ShowPassAgain(showPin = !showPin));
    });

    on<EventLogOut>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      prefs.remove('pin');
      emit(LogOutSucces());
    });
  }

  // Future logout() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.remove('token');
  //   prefs.remove('pin');
  // }

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
