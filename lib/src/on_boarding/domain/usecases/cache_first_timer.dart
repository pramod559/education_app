import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UsecasesWithoutParams<void> {
  CacheFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
