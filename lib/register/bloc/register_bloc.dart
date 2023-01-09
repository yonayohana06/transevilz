import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  //Otp
  String? otpDummy = '123456';
  final codeSubmit = TextEditingController();
  //RegistrationForm
  String chosen = 'pria';
  final email = TextEditingController();
  final noDokumen = TextEditingController();
  final namaDepan = TextEditingController();
  final namaBelakang = TextEditingController();
  final tempatLahir = TextEditingController();
  final tanggalLahir = TextEditingController();
  final alamat = TextEditingController();
  final kataSandi = TextEditingController();
  final confirmKataSandi = TextEditingController();
  bool showPass = true;
  bool showConfirmPass = true;
  RegExp emailFormat = RegExp('[A-Z]*');
  RegExp passFormat = RegExp("[A-Za-z0-9@*#&]*");
  List docType = ['KTP', 'SIM', 'Passport'];
  String? type;
  DateTime? pickedDate;
  File? imageContain;
  bool? ambigous;
  bool checkBox = false;
  //
  bool submitValidator = false;
  final phoneNumber = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? negara;
  bool isActive = false;

  RegisterBloc() : super(RegisterInitial()) {
    on<PhoneNumValidateEvent>((event, emit) {
      RegExp phonerex = RegExp(r'^[8][0-9]{10}');
      final match = phonerex.hasMatch(phoneNumber.text);
      if(match) {
        emit(PhoneNumberValidateState(submitValidator = match));
      }
      if(phoneNumber.text.length < 1) {
        emit(PhoneNumEmptyState());
      }
      if(phoneNumber.text.length > 11) {
        emit(PhoneNumberValidateState(submitValidator = false));
        emit(PhoneNumFormatState());
      }
      if(phoneNumber.text.length < 11
          && phoneNumber.text.length >= 1
          && !match) {
        emit(PhoneNumberValidateState(submitValidator = false));
        emit(PhoneNumFormatState());
      }
    });
    on<RegisterFormButtonEvent>((event, emit) {
      final registerValidate = formkey.currentState!.validate();
      emit(RegisterFormButton(isActive = registerValidate));
    });
    on<ShowPassEvent>((event, emit) {
      emit(ShowPass(showPass = !showPass));
    });
    on<ShowPassConfirmEvent>((event, emit) {
      emit(ShowConfirmPass(showConfirmPass = !showConfirmPass));
    });
    on<ImageDisplayEvent>((event, emit) async {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      File? img = File(image!.path);
      imageContain = img;
      emit(RegisterInitial());
      emit(RegisterFormButton(isActive==!isActive));
    });
    on<ImageRefresh>((event, emit) {
      emit(RegisterFormButton(isActive==!isActive));
    });
  }


  String? validatePhoneNumber(String? v) {
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!RegExp(r'^[8][0-9]{11}').hasMatch(v)) {
      return 'Format No.HP tidak sesuai';
    }
  }

  String? validateEmail(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
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

  String? validateConfirmPassword(String? v) {
    if (v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    } else if (v.length < 8) {
      return 'Terlalu pendek, kata sandi minimal 8 karakter';
    } else if (v != kataSandi.text) {
      return 'Kata sandi tidak sama';
    }
    return null;
  }

  String? validateNoDok(String? v) {
    if(type==null) {
      return 'Anda harus memilih Tipe Dokumen';
    }
    if(type=='KTP') {
      print(noDokumen.text);
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(!RegExp(r'^[0-9]{16}').hasMatch(v)) {
        return 'Format KTP tidak sesuai';
      }
    }
    if(type=='SIM') {
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(!RegExp(r'^[0-9]{12}').hasMatch(v)) {
        return 'Format SIM tidak sesuai';
      }
    }
    if(type=='Passport') {
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(!RegExp(r'^[0-9]{16}').hasMatch(v)) {
        return 'Format Passport tidak sesuai';
      }
    }
  }

  String? validateNamaDepan(String? v) {
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!RegExp(r'^[a-zA-Z]+$').hasMatch(v)){
      return 'Format nama depan salah';
    }
    return null;
  }

  String? validateNamaBelakang(String? v) {
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!RegExp(r'^[a-zA-Z]+$').hasMatch(v)){
      return 'Format nama belakang salah';
    }
    return null;
  }

  String? validateTempatLahir(String? v) {
    final regTempatLahir = RegExp(r'^[a-zA-Z., 0-9]+$');
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!regTempatLahir.hasMatch(v)) {
      return 'Format tempat lahir salah';
    }
    if(v.length < 10) {
      return 'Mohon tuliskan dangan spesifik (Contoh: Sleman, Yogyakarta)';
    }
    return null;
  }

  void datePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2006),
      firstDate: DateTime(1900),
      lastDate: DateTime(2006),
    );
    if(pickedDate != null) {
      tanggalLahir.text = DateFormat('MM/dd/yyyy').format(pickedDate!);
    }
  }

  String? validateTanggalLahir(String? v) {
    final tidakSesuai = RegExp(r'^[0-1][0-9]+/[0-2][0-9]+/[0-9][0-9][0-9][0-9]$|[0-3][0-1]+/[0-9][0-9][0-9][0-9]$');
    final umurTidakCukup = RegExp(r'^[0-1][0-9]+/[0-2][0-9]+/[0-2][0][0][0-5]|[0-3][0-1]+/[0-2][0][0][0-5]|[0-2][0-9]+/[0-1][0-9][0-9][0-9]|[0-3][0-1]+/[0-1][0-9][0-9][0-9]');
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!tidakSesuai.hasMatch(v)) {
      return 'Format tidak sesuai';
    }
    if(!umurTidakCukup.hasMatch(v)) {
      return 'Umur tidak cukup';
    }
    return null;
  }

  String? validateAlamat(String? v) {
    if(v == null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!RegExp(r'^[a-zA-Z., 0-9]+$').hasMatch(v)){
      return 'Format alamat salah';
    }
  }

  String? validateCheckBox(String? v) {
    if(v==false) {
      return 'Mohon setujui bagian ini';
    }
  }

  //OtpLogic
  String? otpManualKeyboard(String value) {
    if(value == 'del') {
      if(codeSubmit.text.isEmpty) {
        return null;
      }
      final deleting = codeSubmit.text.split('');
    }
  }
}
