import 'package:dartz/dartz.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/core/errors/failures.dart';

class GetCourses extends UsecasesWithParams<void, String> {
  final AuthRepo _repo;

  GetCourses(this._repo);

  @override
  ResultFuture<void> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
