part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterFailed extends RegisterState {
  const RegisterFailed();
  @override
  List<Object> get props => [];
}

//Validate
class PhoneNumEmptyState extends RegisterState {
  @override
  List<Object> get props => [];
}

class PhoneNumFormatState extends RegisterState {
  @override
  List<Object> get props => [];
}

class PhoneNumberValidateState extends RegisterState {
  final bool isEnable;
  const PhoneNumberValidateState(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class NextState extends RegisterState {
  final String number;
  NextState(this.number);
  @override
  List<Object> get props => [];
}

//RegisterForm
class RegisterFormButton extends RegisterState {
  final bool isEnable;
  const RegisterFormButton(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class ShowPass extends RegisterState {
  final bool status;
  const ShowPass(this.status);
  @override
  List<Object> get props => [status];
}

class ShowConfirmPass extends RegisterState {
  final bool status;
  const ShowConfirmPass(this.status);
  @override
  List<Object> get props => [status];
}

class ImageDisp extends RegisterState {
  @override
  List<Object> get props => [];
}

class PhoneRegistered extends RegisterState {
  @override
  List<Object> get props => [];
}