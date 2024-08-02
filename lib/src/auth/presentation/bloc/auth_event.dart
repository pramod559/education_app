part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });
  @override
  List<String> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
  @override
  List<String> get props => [email, password];
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  const ForgotPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class UpdateUserEvent extends AuthEvent {
  final UpdateUserAction action;
  final dynamic userData;

  UpdateUserEvent({required this.action, required this.userData})
      : assert(
            userData is String || userData is File,
            'UserData must be either a String or a file,but was'
            ' ${userData.runtimeType}');

  @override
  List<Object> get props => [action, userData];
}
