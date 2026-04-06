part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoadingState extends AuthState {}

final class LoginSuccessState extends AuthState {}

final class LoginFailureState extends AuthState {
  final String? errorMessage;
  LoginFailureState(this.errorMessage);
}

final class RegisterLoadingState extends AuthState {}

final class RegisterSuccessState extends AuthState {}

final class RegisterFailureState extends AuthState {
  final String? errorMessage;
  RegisterFailureState(this.errorMessage);
}

final class LogoutLoadingState extends AuthState {}

final class LogoutSuccessState extends AuthState {}

final class LogoutFailureState extends AuthState {
  final String? errorMessage;
  LogoutFailureState(this.errorMessage);
}

final class LoginWithGoogleLoadingState extends AuthState {}

final class LoginWithGoogleSuccessState extends AuthState {}

final class LoginWithGoogleFailureState extends AuthState {
  final String? errorMessage;
  LoginWithGoogleFailureState(this.errorMessage);
}
