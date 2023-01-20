part of 'forgot_pin_bloc.dart';

abstract class ForgotPinEvent extends Equatable {
  const ForgotPinEvent();

  @override
  List<Object> get props => [];
}

class SubmitEmailPin extends ForgotPinEvent {}

class SubmitNewPin extends ForgotPinEvent {}

class StatusButtonPin extends ForgotPinEvent {}

class ShowNewPin extends ForgotPinEvent {}

class ShowNewPinAgain extends ForgotPinEvent {}
