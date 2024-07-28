import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class SignIn extends UsecasesWithParams<LocalUser, SignInParams> {
  final AuthRepo _repo;

  SignIn(this._repo);

  @override
  ResultFuture<LocalUser> call(SignInParams params) => _repo.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  final String email;
  final String password;
  const SignInParams.empty()
      : email = '',
        password = '';
  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
