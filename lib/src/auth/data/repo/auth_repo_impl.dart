import 'package:dartz/dartz.dart';
import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:education_app/src/auth/data/models/user_model.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);
  @override
  ResultFuture<void> forgetPassword(String email) async {
    try {
      await _remoteDataSource.forgotPassword(email);

      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  ResultFuture<LocalUserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  ResultFuture<void> signUp(
      {required String email,
      required String fullName,
      required String password}) async {
    try {
      await _remoteDataSource.signUp(
        email: email,
        fullName: fullName,
        password: password,
      );
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  ResultFuture<void> updateUser(
      {required UpdateUserAction action, userData}) async {
    try {
      await _remoteDataSource.updateUser(action: action, userData: userData);
      return Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }
}
