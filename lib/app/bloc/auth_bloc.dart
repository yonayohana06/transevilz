import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:transevilz/app/helpers/token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckAuth>((event, emit) async {
      emit(AuthLoading());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        emit(const AuthFailed('User not Found'));
      } else {
        emit(AuthSuccesful());
      }
    });

    // on<LogOut>((event, emit) async {
    //   emit(AuthLoading());
    //   final firebase = FirebaseAuth.instance;
    //   await firebase.signOut().then((value) {
    //     emit(AuthLoggedOut());
    //   });
    // });
  }

  final bool isAuth = false;
}
