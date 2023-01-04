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
  String chosen = 'wni';
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
  List<Map> json = [
    {
      'id':'0',
      'image':'assets/images/australia.png',
      'name':'Australia',
      'numcode':'+61',
    },
    {
      'id':'1',
      'image':'assets/images/japan.png',
      'name':'Japan',
      'numcode':'+1',
    },
    {
      'id':'2',
      'image':'assets/images/indonesia.png',
      'name':'Indonesia',
      'numcode':'+62',
    },
    {
      'id':'3',
      'image':'assets/images/singapore.png',
      'name':'Singapore',
      'numcode':'+65',
    },
    {
      'id':'4',
      'image':'assets/images/us.png',
      'name':'United States of America',
      'numcode':'+1',
    },
  ];

  RegisterBloc() : super(RegisterInitial()) {
    on<ChangeNumCode>((event, emit){
      print(negara!.length);
      if(negara==
          '{id: 0, '
              'image: assets/images/australia.png, '
              'name: Australia, numcode: +61}'
      ) {
        emit(Australia());
        RegExp regexpaus = RegExp(r'^[0-9]{8}$');
        final match = regexpaus.hasMatch(phoneNumber.text);
        if(match) {
          print('valid');
          submitValidator=match;
          emit(RegisterButtonAustralia(submitValidator=match));
        }
        if(phoneNumber.text.isEmpty) {
          emit(FieldHarusTerisiAustralia());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 7
            && phoneNumber.text.length > 0
        ) {
          emit(NomorTerlaluPendekAustralia());
          submitValidator=false;
        }
        if(phoneNumber.text.length > 8) {
          emit(NomorTerlaluPendekAustralia());
          submitValidator=false;
        }
      }
      if(negara==
          '{id: 1, '
              'image: assets/images/japan.png, '
              'name: Japan, numcode: +1}'
      ) {
        emit(Japan());
        RegExp regexpaus = RegExp(r'^[0-9]{8}$');
        final match = regexpaus.hasMatch(phoneNumber.text);
        if(match) {
          print('valid');
          submitValidator=match;
          emit(RegisterButtonJapan(submitValidator=match));
        }
        if(phoneNumber.text.isEmpty) {
          emit(FieldHarusTerisiJapan());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 7
            && phoneNumber.text.length > 0
        ) {
          emit(NomorTerlaluPendekJapan());
          submitValidator=false;
        }
        if(phoneNumber.text.length > 8) {
          emit(NomorTerlaluPendekJapan());
          submitValidator=false;
        }
      }
      if(negara==
          '{id: 2, '
              'image: assets/images/indonesia.png, '
              'name: Indonesia, numcode: +62}'
      ) {
        emit(Indonesia());
        RegExp regexpind = RegExp(r'^(8)[0-9]{10}$');
        final match = regexpind.hasMatch(phoneNumber.text);
        if(match) {
          print('valid');
          submitValidator=match;
          emit(RegisterButtonIndonesia(submitValidator=match));
        }
        if(phoneNumber.text.isEmpty) {
          emit(FieldHarusTerisiIndonesia());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 10
            && phoneNumber.text.length > 0
        ) {
          emit(NomorTerlaluPendekIndonesia());
          submitValidator=false;
        }
        if(phoneNumber.text.length > 11) {
          emit(NomorTerlaluPendekIndonesia());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 11
            && phoneNumber.text.length > 0 && !match) {
          emit(NomorTerlaluPendekIndonesia());
          submitValidator=false;
        }
      }
      if(negara==
          '{id: 3, '
              'image: assets/images/singapore.png, '
              'name: Singapore, numcode: +65}'
      ) {
        emit(Singapore());
        RegExp regexpaus = RegExp(r'^[0-9]{8}$');
        final match = regexpaus.hasMatch(phoneNumber.text);
        if(match) {
          print('valid');
          submitValidator=match;
          emit(RegisterButtonSingapore(submitValidator=match));
        }
        if(phoneNumber.text.isEmpty) {
          emit(FieldHarusTerisiSingapore());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 7
            && phoneNumber.text.length > 0
        ) {
          emit(NomorTerlaluPendekSingapore());
          submitValidator=false;
        }
        if(phoneNumber.text.length > 8) {
          emit(NomorTerlaluPendekSingapore());
          submitValidator=false;
        }
      }
      if(negara==
          '{id: 4, '
              'image: assets/images/us.png, '
              'name: United States of America, numcode: +1}'
      ) {
        emit(Usa());
        RegExp regexpaus = RegExp(r'^[0-9]{8}$');
        final match = regexpaus.hasMatch(phoneNumber.text);
        if(match) {
          print('valid');
          submitValidator=match;
          emit(RegisterButtonUsa(submitValidator=match));
        }
        if(phoneNumber.text.isEmpty) {
          emit(FieldHarusTerisiUsa());
          submitValidator=false;
        }
        if(phoneNumber.text.length <= 7
            && phoneNumber.text.length > 0
        ) {
          emit(NomorTerlaluPendekUsa());
          submitValidator=false;
        }
        if(phoneNumber.text.length > 8) {
          emit(NomorTerlaluPendekUsa());
          submitValidator=false;
        }
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
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        File? img = File(image!.path);
        imageContain = img;
        emit(RegisterFormButton(isActive==!isActive));
      } on PlatformException catch (e) {
        print(e);
      }
    });
  }

  String? validateEmail(String? v) {
    if (v == null || v.isEmpty) {
      return 'Email diperlukan';
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(v)) {
      return 'Format email invalid';
    }
    return null;
  }

  String? validatePassword(String? v) {
    RegExp regex =
    RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[@#&*]).{8,}$');
    if (v == null || v.isEmpty) {
      return 'Kata sandi diperlukan';
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
      return 'Kata sandi diperlukan';
    } else if (v.length < 8) {
      return 'Terlalu pendek, kata sandi minimal 8 karakter';
    } else if (v != kataSandi.text) {
      return 'Kata Sandi Tidak Sama';
    }
    return null;
  }

  String? validateNoDok(String? v) {
    if(type==null) {
      return 'Anda harus memilih Tipe Dokumen';
    }
    if(type=='KTP') {
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(v.length < 16) {
        return 'KTP Salah';
      }
    }
    if(type=='SIM') {
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(v.length < 12) {
        return 'SIM Salah';
      }
    }
    if(type=='Passport') {
      if(v!.isEmpty) {
        return 'Anda harus mengisi bagian ini';
      }
      if(v.length < 16) {
        return 'Passport Salah';
      }
    }
  }

  String? validateNamaDepan(String? v) {
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    return null;
  }

  String? validateNamaBelakang(String? v) {
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    return null;
  }

  String? validateTempatLahir(String? v) {
    final regTempatLahir = RegExp(r'^[a-zA-Z]+,');
    if(v==null || v.isEmpty) {
      return 'Anda harus mengisi bagian ini';
    }
    if(!regTempatLahir.hasMatch(v)) {
      return 'Mohon tuliskan dangan spesifik';
    }
    return null;
  }

  void datePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2006),
    );
    if(pickedDate != null) {
      tanggalLahir.text = DateFormat('MM/dd/yyyy').format(pickedDate!);
    }
  }

  String? validateTanggalLahir(String? v) {
    final tidakSesuai = RegExp(r'^[0-1][0-9]+/[0-2][0-9]+/[0-9][0-9][0-9][0-9]|[0-3][0-1]+/[0-9][0-9][0-9][0-9]');
    final umurTidakCukup = RegExp(r'^[0-1][0-9]+/[0-2][0-9]+/[0-2][0][0][0-6]|[0-3][0-1]+/[0-2][0][0][0-6]|[0-2][0-9]+/[0-1][0-9][0-9][0-9]|[0-3][0-1]+/[0-1][0-9][0-9][0-9]');
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
  }
}
