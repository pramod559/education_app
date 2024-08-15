import 'package:education_app/core/utils/typedefs.dart';

abstract class UsecaseWithParams<Type, Params> {
  UsecaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecasesWithoutParams<Type> {
  UsecasesWithoutParams();

  ResultFuture<Type> call();
}
