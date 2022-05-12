part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent  {
  const AuthEvent();


}

class AppStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {
  // final User user;
  //
  // LoggedIn(this.user);
}

class LoginEmailChanged extends AuthEvent {
  final String email;

  LoginEmailChanged({required this.email});
}

class LoginPasswordChanged extends AuthEvent {
  final String password;

  LoginPasswordChanged({required this.password});
}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  print(password) {
    // TODO: implement print
    print("$password");
    throw UnimplementedError();
  }
}

class LoggedOut extends AuthEvent {}
