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

//MatchFormatEveryCountry
class RegisterButtonAustralia extends RegisterState {
  final bool isEnable;
  const RegisterButtonAustralia(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class RegisterButtonJapan extends RegisterState {
  final bool isEnable;
  const RegisterButtonJapan(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class RegisterButtonIndonesia extends RegisterState {
  final bool isEnable;
  const RegisterButtonIndonesia(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class RegisterButtonSingapore extends RegisterState {
  final bool isEnable;
  const RegisterButtonSingapore(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}

class RegisterButtonUsa extends RegisterState {
  final bool isEnable;
  const RegisterButtonUsa(this.isEnable);
  @override
  List<Object> get props => [isEnable];
}


//FormatNumberValidatorEveryCountry
class NomorTerlaluPendekAustralia extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisiAustralia extends RegisterState {
  @override
  List<Object> get props => [];
}

class NomorTerlaluPendekJapan extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisiJapan extends RegisterState {
  @override
  List<Object> get props => [];
}

class NomorTerlaluPendekIndonesia extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisiIndonesia extends RegisterState {
  @override
  List<Object> get props => [];
}

class NomorTerlaluPendekSingapore extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisiSingapore extends RegisterState {
  @override
  List<Object> get props => [];
}

class NomorTerlaluPendekUsa extends RegisterState {
  @override
  List<Object> get props => [];
}

class FieldHarusTerisiUsa extends RegisterState {
  @override
  List<Object> get props => [];
}

//CountryChangeState
class Australia extends RegisterState {
  @override
  List<Object> get props => [];
}

class Japan extends RegisterState {
  @override
  List<Object> get props => [];
}

class Indonesia extends RegisterState {
  @override
  List<Object> get props => [];
}

class Singapore extends RegisterState {
  @override
  List<Object> get props => [];
}

class Usa extends RegisterState {
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

class BorderValidate extends RegisterState {
  @override
  List<Object> get props => [];
}

class ImageDisp extends RegisterState {
  @override
  List<Object> get props => [];
}