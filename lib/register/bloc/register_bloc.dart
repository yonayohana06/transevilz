import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  bool submitValidator = false;
  final phoneNumber = TextEditingController();
  final formkey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonMode>((event, emit) {
      RegExp regexp = RegExp(r'^(?:8)[0-9]{10}$');
      final match = regexp.hasMatch(phoneNumber.text);
      if(match) {
        print('valid');
        submitValidator=match;
        emit(RegisterButton(submitValidator=match));
      }
      if(phoneNumber.text.isEmpty) {
        emit(FieldHarusTerisi());
        submitValidator=false;
      }
      if(phoneNumber.text.length <= 10
          && phoneNumber.text.length > 0
      ) {
        emit(NomorTerlaluPendek());
        submitValidator=false;
      }
      if(phoneNumber.text.length > 11) {
        emit(NomorTerlaluPendek());
        submitValidator=false;
      }
    });
  }
}
