part of 'forgot_bloc.dart';

abstract class ForgotEvent extends Equatable {
  const ForgotEvent();
}

class SubmitEmail extends ForgotEvent {
  @override
  List<Object> get props => [];
}

class SubmitNewPassword extends ForgotEvent {
  @override
  List<Object> get props => [];
}

class StatusButton extends ForgotEvent {
  @override
  List<Object> get props => [];
}

class ShowNewPass extends ForgotEvent {
  @override
  List<Object> get props => [];
}

class ShowNewPassAgain extends ForgotEvent {
  @override
  List<Object> get props => [];
}

class InitEmail extends ForgotEvent {
  final String email;

  InitEmail(this.email);
  @override
  List<Object> get props => [email];
}
