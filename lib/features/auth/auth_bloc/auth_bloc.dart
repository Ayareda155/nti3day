import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task4/features/auth/data/models/user_data_class.dart';
import 'package:task4/features/auth/services/firebase_auth_services.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        await FirebaseAuthService.login(userData: event.user);
        emit(LoginSuccessState());
      } catch (e) {
        emit(LoginFailureState(e.toString()));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoadingState());
      try {
        await FirebaseAuthService.register(userData: event.user);
        emit(RegisterSuccessState());
      } catch (e) {
        emit(RegisterFailureState(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(LogoutLoadingState());
      try {
        await FirebaseAuthService.logout();
        emit(LogoutSuccessState());
      } catch (e) {
        emit(LogoutFailureState(e.toString()));
      }
    });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoginWithGoogleLoadingState());
      try {
        await FirebaseAuthService.signInWithGoogle();
        emit(LoginWithGoogleSuccessState());
      } catch (e) {
        emit(LoginWithGoogleFailureState(e.toString()));
      }
    });
  }
}
