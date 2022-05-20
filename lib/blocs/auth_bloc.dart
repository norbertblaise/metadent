import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:metadent/blocs/formSubmissionStatus.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../providers/resources/authRepository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthUninitialized()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<LoginButtonPressed>(_onAuthSubmitted);
    on<AppStarted>(_onAppStarted);
  }

  void _onLoginEmailChanged(LoginEmailChanged event, Emitter<AuthState> emit) {
    emit(AuthState(email: event.email));
  }

  void _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<AuthState> emit) {
    emit(AuthState(password: event.password));
  }

  void _onAuthSubmitted(
      LoginButtonPressed event, Emitter<AuthState> emit) async {
    emit(AuthState(formStatus: FormSubmitting()));
    try {
      ApiResponse apiResponse = await authRepository.authenticateUser(
          email: event.email, password: event.password);
      String authToken = apiResponse.payload.token;
      User user = apiResponse.payload.user;
      var userJson = json.encode(user.toJson());
      if (kDebugMode) {
        print("userjson is $userJson");
      }
      const storage = FlutterSecureStorage();
      // SharedPreferences prefs = await SharedPreferences.getInstance();

      await storage.write(key: 'token', value: authToken);
      await storage.write(key: 'userData', value: userJson);
      // await prefs.setString("user", userJson);
      if (kDebugMode) {
        print("auth token is $authToken");
      }
      //todo save token to sharePref
      emit(AuthState(formStatus: SubmissionSuccess()));
      emit(AuthAuthenticated());
    } catch (e) {
      emit(AuthState(formStatus: SubmissionFailed(Exception(e))));
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(AuthLoading());
    //todo get token
    emit(AuthAuthenticated());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    //todo delete token
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
    emit(AuthUnAuthenticated());
  }

  FutureOr<void> _onAppStarted(
      AppStarted event, Emitter<AuthState> emit) async {
    //check for token
    var tokenExists =
        await const FlutterSecureStorage().containsKey(key: 'token');
    if (kDebugMode) {
      print("token exists: $tokenExists");
    }

    if (tokenExists) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnAuthenticated());
    }
  }
}

// final authBloc = AuthBloc(authRepository);
