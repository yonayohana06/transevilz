
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transevilz/history/model_data/modelJson.dart';
import 'package:http/http.dart' as http;

import '../model_data/model.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  //Transaction
  TextEditingController firstRange = TextEditingController();
  TextEditingController lastRange = TextEditingController();
  List<History> tempData = [
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugr',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2023, 01, 07),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2023, 01, 01),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2023, 01, 02),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Gagal',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2023, 01, 06),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2023, 01, 03),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Berhasil',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2022, 09, 28),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2022, 09, 15),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Berhasil',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2022, 10, 20),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: DateTime(2022, 10, 09),
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Gagal',
    ),
  ];

  DateTime? pickedFrom;
  DateTime? pickedTill;
  DateTimeRange? dateRange;

  HistoryBloc() : super(HistoryInitial()) {
    on<SampaiEvent>((event, emit) {
      emit(HistoryLoading());
    });
    on<DariEvent>((event, emit) {
      if(pickedFrom != null && pickedTill != null) {
        emit(HistoryLoaded());
        if(pickedTill!.isBefore(pickedFrom!)) {
          emit(InversedDate());
        }
      }
    });
  }

  Future<void> pickedFromData(BuildContext context) async {
    pickedFrom = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if(pickedFrom==null) {
      return null;
    }
    final dateFormatedFrom = DateFormat('dd/MM/yyyy').format(pickedFrom!);
    firstRange.text = dateFormatedFrom.toString();
  }

  Future<void> pickedTillData(BuildContext context) async {
    pickedTill = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );
    if(pickedTill==null) {
      return null;
    }
    final dateFormattedTill = DateFormat('dd/MM/yyyy').format(pickedTill!);
    lastRange.text = dateFormattedTill.toString();
  }


  Future<List<HistoryTrans>> fetchDataUser() async {
    final urlUp = Uri.parse('https://red-gifted-squid.cyclic.app/api/v1/myTransaction');
    final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhYjUzNGRjOC05MzllLTRkYzMtYmRlMi1jOTRlZWQ5YWRlNzkiLCJpYXQiOjE2NzQwMjYzNzIsImV4cCI6MTY3NDQ1ODM3Mn0.xuHtEWZsEGGJuVbcYRkVR73wB_vh1DcBS2EaOoZKWlE';

    Map<String, String> headersCust = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}'
    };

    final response = await http.post(urlUp, headers: headersCust);
    print(response.body);

    final List result = jsonDecode(response.body);
    return result.map((e) => HistoryTrans.fromJson(e)).toList();
  }
}
