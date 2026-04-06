part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final UserDataClass user;
  LoginEvent(this.user);
}

final class RegisterEvent extends AuthEvent {
  final UserDataClass user;
  RegisterEvent(this.user);
}

final class LogoutEvent extends AuthEvent {}

final class LoginWithGoogleEvent extends AuthEvent {}
