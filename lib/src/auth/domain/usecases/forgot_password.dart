import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UsecasesWithParams<void, String> {
  final AuthRepo _repo;

  ForgotPassword(this._repo);

  @override
  ResultFuture<void> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
