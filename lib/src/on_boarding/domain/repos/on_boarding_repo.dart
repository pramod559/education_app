import 'package:education_app/core/utils/typedefs.dart';

abstract class OnBoardingRepo {
  OnBoardingRepo();

  ResultFuture<void> cacheFirstTimer();
  ResultFuture<bool> checkIfUserIsFirstTimer();
}
