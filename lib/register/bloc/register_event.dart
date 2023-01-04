part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class ChangeNumCode extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class RegisterFormButtonEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class ShowPassEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class ShowPassConfirmEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}

class ImageDisplayEvent extends RegisterEvent {
  @override
  List<Object> get props => [];
}