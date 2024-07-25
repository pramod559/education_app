import 'package:education_app/core/utils/typedefs.dart';

abstract class UsecasesWithParams<Type, Params> {
  UsecasesWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UsecasesWithoutParams<Type> {
  UsecasesWithoutParams();

  ResultFuture<Type> call();
}
