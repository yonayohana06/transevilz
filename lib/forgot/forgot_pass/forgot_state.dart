part of 'forgot_bloc.dart';

abstract class ForgotState extends Equatable {
  const ForgotState();

  @override
  List<Object> get props => [];
}

class ForgotInitial extends ForgotState {}

class ForgotLoading extends ForgotState {}

class NewPassSuccess extends ForgotState {}

class NewPassFailed extends ForgotState {
  final String message;

  const NewPassFailed(this.message);
  @override
  List<Object> get props => [message];
}

class EmailSuccess extends ForgotState {}

class EmailFailed extends ForgotState {
  final String message;

  const EmailFailed(this.message);
  @override
  List<Object> get props => [message];
}

class ButtonStatus extends ForgotState {
  final bool isEnable;

  const ButtonStatus(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class PassStatus extends ForgotState {
  final bool status;

  const PassStatus(this.status);
  @override
  List<Object> get props => [status];
}

class PassStatusAgain extends ForgotState {
  final bool status;

  const PassStatusAgain(this.status);
  @override
  List<Object> get props => [status];
}
