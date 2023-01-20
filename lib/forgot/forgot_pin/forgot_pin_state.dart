part of 'forgot_pin_bloc.dart';

abstract class ForgotPinState extends Equatable {
  const ForgotPinState();

  @override
  List<Object> get props => [];
}

class ForgotPinInitial extends ForgotPinState {}

class ForgotPinLoading extends ForgotPinState {}

class ForgotPinSuccess extends ForgotPinState {}

class ForgotPinFailed extends ForgotPinState {
  final String msg;

  const ForgotPinFailed(this.msg);
  @override
  List<Object> get props => [msg];
}

class ButtonPinStatus extends ForgotPinState {
  final bool isEnable;

  const ButtonPinStatus(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class ShowPinStatus extends ForgotPinState {
  final bool status;

  const ShowPinStatus(this.status);
  @override
  List<Object> get props => [status];
}

class ShowPinStatusAgain extends ForgotPinState {
  final bool status;

  const ShowPinStatusAgain(this.status);
  @override
  List<Object> get props => [status];
}
