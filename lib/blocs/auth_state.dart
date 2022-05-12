part of 'auth_bloc.dart';

@immutable
class AuthState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  const AuthState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  AuthState copyWith(
      {String? email,
      String? password,
      FormSubmissionStatus? formSubmissionStatus}) {
    return AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus);
  }

}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthUnAuthenticated extends AuthState {}

class AuthLoading extends AuthState {}
