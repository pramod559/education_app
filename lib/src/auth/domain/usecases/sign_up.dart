import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class SignUp extends UsecasesWithParams<void, SignUpParams> {
  final AuthRepo _repo;

  SignUp(this._repo);

  @override
  ResultFuture<void> call(SignUpParams params) => _repo.signUp(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );
}

class SignUpParams extends Equatable {
  final String email;
  final String password;
  final String fullName;
  const SignUpParams.empty()
      : email = '',
        password = '',
        fullName = '';
  const SignUpParams(
      {required this.email, required this.fullName, required this.password});

  @override
  List<Object?> get props => [email, password, fullName];
}
