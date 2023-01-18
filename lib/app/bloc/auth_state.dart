part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthSuccesful extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthFailed extends AuthState {
  final String message;

  const AuthFailed(this.message);
  @override
  List<Object> get props => [message];
}

class AuthLoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}
