import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  bool isLanguageID = true;
  bool isAllowed = false;
  final prefs = SharedPreferences.getInstance();
  final permissionprefs = SharedPreferences.getInstance();
  ProfileBloc() : super(ProfileInitial()) {
    on<ButtonEvent>((event, emit) {
      getLanguage(isLanguageID);
      getPermission(isAllowed);
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

  Future<bool> setPermission(value) async {
    final permisson = await permissionprefs;
    return permisson.setBool('permission', isAllowed=value);
  }

  Future<bool> getPermission(bool val) async {
    final permission = await permissionprefs;
    isAllowed = permission.getBool('permission') ?? false;
    val = isAllowed;
    return isAllowed;
  }
}
