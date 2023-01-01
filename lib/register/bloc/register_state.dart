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
  final String message;
  const RegisterFailed(this.message);
  @override
  List<Object> get props => [message];
}

class RegisterButton extends RegisterState {
  final bool isEnable;
  const RegisterButton(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class NomorTerlaluPendek extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisi extends RegisterState {
  @override
  List<Object> get props => [];
}