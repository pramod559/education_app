import 'package:dartz/dartz.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';
import 'package:education_app/src/auth/domain/usecases/sign_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'auth_repo.mock.dart';

void main() {
  late MockAuthRepo repo;
  late SignUp usecase;

  const tEmail = 'Test email';
  const tPassword = 'Test password';
  const tFullName = 'Test fullname';

  setUp(() {
    repo = MockAuthRepo();
    usecase = SignUp(repo);
  });

  const tUser = LocalUser.empty();
  test(
    'should return [LocalUser] from the [AuthRepo]',
    () async {
      when(
        () => repo.signUp(
          email: any(named: 'email'),
          password: any(named: 'password'),
          fullName: any(named: 'fullName'),
        ),
      ).thenAnswer((_) async => const Right(tUser));

      final result = await usecase(const SignUpParams(
        email: tEmail,
        password: tPassword,
        fullName: tFullName,
      ));
      expect(result, const Right<dynamic, LocalUser>(tUser));
      verify(
        () => repo.signUp(
            email: tEmail, password: tPassword, fullName: tFullName),
      ).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
