import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecasesWithoutParams<bool> {
  final OnBoardingRepo _repo;

  CheckIfUserIsFirstTimer(this._repo);
  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();
}
