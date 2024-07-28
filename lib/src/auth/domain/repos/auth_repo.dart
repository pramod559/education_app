//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  AuthRepo();

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });
  ResultFuture<void> forgetPassword(
    String email,
  );
  ResultFuture<void> updateUser({
    required UpdateUserAction action,
    required dynamic userData,
  });
}
