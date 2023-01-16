import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  bool isLanguageID = true;
  final prefs = SharedPreferences.getInstance();
  ProfileBloc() : super(ProfileInitial()) {
    on<ButtonEvent>((event, emit) {
      getLanguage(isLanguageID);
    });
  }
  
  Future<bool> setLanguage(value) async {
    final lang = await prefs;
    return lang.setBool('language', isLanguageID=value);
  }

  Future<bool> getLanguage(bool val) async {
    final lang = await prefs;
    isLanguageID = lang.getBool('language') ?? true;
    val = isLanguageID;
    return isLanguageID;
  }
}
