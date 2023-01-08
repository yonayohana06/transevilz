
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      status: 'Dalam Proses',
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
        dateRange = DateTimeRange(
          start: pickedFrom!,
          end: pickedTill!,
        );
        if(dateRange != null) {
          print(dateRange);
          emit(HistoryLoaded());
        }
      }
    });
  }

  Future<void> pickedFromData(BuildContext context) async {
    pickedFrom = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    final dateFormatedFrom = DateFormat('dd/MM/yyyy').format(pickedFrom!);
    firstRange.text = dateFormatedFrom.toString();
  }

  void pickedTillData(BuildContext context) async {
    pickedTill = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    final dateFormattedTill = DateFormat('dd//MM/yyyy').format(pickedTill!);
    lastRange.text = dateFormattedTill.toString();
  }
}
