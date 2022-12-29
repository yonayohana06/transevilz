part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucces extends LoginState {}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);
  @override
  List<Object> get props => [message];
}

class PinSucces extends LoginState {}

class PinFailed extends LoginState {
  final String message;

  const PinFailed(this.message);
  @override
  List<Object> get props => [message];
}

class LoginButton extends LoginState {
  final bool isEnable;

  const LoginButton(this.isEnable);

  @override
  List<Object> get props => [isEnable];
}

class ShowPass extends LoginState {
  final bool status;

  const ShowPass(this.status);

  @override
  List<Object> get props => [status];
}

class ShowPassAgain extends LoginState {
  final bool status;

  const ShowPassAgain(this.status);

  @override
  List<Object> get props => [status];
}
