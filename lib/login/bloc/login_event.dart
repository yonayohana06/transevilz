part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SubmitLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class SubmitPin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ButtonLogin extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ShowPassword extends LoginEvent {
  @override
  List<Object> get props => [];
}

class ShowPin extends LoginEvent {
  @override
  List<Object> get props => [];
}
