import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/auth/data/models/user_model.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:education_app/src/auth/domain/usecases/forgot_password.dart';
import 'package:education_app/src/auth/domain/usecases/sign_in.dart';
import 'package:education_app/src/auth/domain/usecases/sign_up.dart';
import 'package:education_app/src/auth/domain/usecases/update_user.dart';
import 'package:education_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignIn extends Mock implements SignIn {}

class MockSignUp extends Mock implements SignUp {}

class MockForgotPassword extends Mock implements ForgotPassword {}

class MockUpdateUser extends Mock implements UpdateUser {}

void main() {
  late SignIn signIn;
  late SignUp signUp;
  late ForgotPassword forgotPassword;
  late UpdateUser updateUser;
  late AuthBloc authBloc;

  // const tPassword = 'password';
  // const tEmail = 'email';
  // const tFullName = 'fullName';
  // const tUpdateUserAction = UpdateUserAction.password;
  const tSignUpParams = SignUpParams.empty();
  const tUpdateUserParams = UpdateUserParams.empty();
  const tSignInParams = SignInParams.empty();

  setUp(() {
    signIn = MockSignIn();
    signUp = MockSignUp();
    forgotPassword = MockForgotPassword();
    updateUser = MockUpdateUser();
    authBloc = AuthBloc(
        signIn: signIn,
        signUp: signUp,
        forgotPassword: forgotPassword,
        updateUser: updateUser);
  });
  setUpAll(() {
    registerFallbackValue(tUpdateUserParams);
    registerFallbackValue(tSignInParams);
    registerFallbackValue(tSignInParams);
  });

  tearDown(() => authBloc.close());

  test('initialState should be [AuthInitial]', () {
    expect(authBloc.state, AuthInitial());
  });
  final tServerFailure = ServerFailure(
      message: 'user-not-found',
      statusCode:
          'There is no user record corresponding to this identifier. the user may have been deleted');

  group('SignInEvent', () {
    const tUser = LocalUserModel.empty();

    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading] when [SignInEvent] is added',
        build: () {
          when(() => signIn(any())).thenAnswer((_) async => const Right(tUser));
          return authBloc;
        },
        act: (bloc) => bloc.add(
              SignInEvent(
                email: tSignInParams.email,
                password: tSignInParams.password,
              ),
            ),
        expect: () => [
              AuthLoading(),
              SignedIn(tUser),
            ],
        verify: (_) {
          verify(() => signIn(tSignInParams)).called(1);
          verifyNoMoreInteractions(signIn);
        });
    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,AuthError] when signIn failed',
        build: () {
          when(() => signIn(any()))
              .thenAnswer((_) async => Left(tServerFailure));
          return authBloc;
        },
        act: (bloc) => bloc.add(
              SignInEvent(
                email: tSignInParams.email,
                password: tSignInParams.password,
              ),
            ),
        expect: () =>
            [AuthLoading(), AuthError(message: tServerFailure.errorMessage)],
        verify: (_) {
          verify(() => signIn(tSignInParams)).called(1);
          verifyNoMoreInteractions(signIn);
        });
////////signUpEvent///////////

    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading] when [SignUpEvent] is added',
        build: () {
          when(() => signUp(any())).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
              SignUpEvent(
                email: tSignUpParams.email,
                password: tSignUpParams.password,
                name: tSignUpParams.fullName,
              ),
            ),
        expect: () => [
              AuthLoading(),
              SignedUp(),
            ],
        verify: (_) {
          verify(() => signUp(tSignUpParams)).called(1);
          verifyNoMoreInteractions(signUp);
        });
    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,AuthError] when SignUpEvent is added and '
        'SignUp fails',
        build: () {
          when(() => signUp(any()))
              .thenAnswer((_) async => Left(tServerFailure));
          return authBloc;
        },
        act: (bloc) => bloc.add(
              SignUpEvent(
                email: tSignUpParams.email,
                password: tSignUpParams.password,
                name: tSignUpParams.fullName,
              ),
            ),
        expect: () =>
            [AuthLoading(), AuthError(message: tServerFailure.errorMessage)],
        verify: (_) {
          verify(() => signUp(tSignUpParams)).called(1);
          verifyNoMoreInteractions(signUp);
        });

    //////////forgotPasswordEvent//////////
    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,forgotPasswordSent] when forgotPasswordEvent'
        ' is added and forgotPassword succeeds',
        build: () {
          when(() => forgotPassword(any())).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
              const ForgotPasswordEvent(email: 'email'),
            ),
        expect: () => [
              AuthLoading(),
              ForgotPasswordSent(),
            ],
        verify: (_) {
          verify(() => forgotPassword('email')).called(1);
          verifyNoMoreInteractions(forgotPassword);
        });
    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,AuthError] when forgotPasswordEvent is added'
        ' and ForgotPassword fails',
        build: () {
          when(() => forgotPassword(any()))
              .thenAnswer((_) async => Left(tServerFailure));
          return authBloc;
        },
        act: (bloc) => bloc.add(
              const ForgotPasswordEvent(
                email: 'email',
              ),
            ),
        expect: () =>
            [AuthLoading(), AuthError(message: tServerFailure.errorMessage)],
        verify: (_) {
          verify(() => forgotPassword('email')).called(1);
          verifyNoMoreInteractions(forgotPassword);
        });

    ////////////

    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,UserUpdated] when UpdateUserEvent is added'
        ' and updateUser succeeds',
        build: () {
          when(() => updateUser(any())).thenAnswer(
            (_) async => const Right(null),
          );
          return authBloc;
        },
        act: (bloc) => bloc.add(
              UpdateUserEvent(
                action: tUpdateUserParams.action,
                userData: tUpdateUserParams.userData,
              ),
            ),
        expect: () => [
              AuthLoading(),
              UserUpdated(),
            ],
        verify: (_) {
          verify(() => updateUser(tUpdateUserParams)).called(1);
          verifyNoMoreInteractions(updateUser);
        });

    blocTest<AuthBloc, AuthState>(
        'should emit [AuthLoading,AuthError] when UpdateUserEvent is added'
        ' and UpdateUser fails',
        build: () {
          when(() => updateUser(any()))
              .thenAnswer((_) async => Left(tServerFailure));
          return authBloc;
        },
        act: (bloc) => bloc.add(
              UpdateUserEvent(
                action: tUpdateUserParams.action,
                userData: tUpdateUserParams.userData,
              ),
            ),
        expect: () => [
              AuthLoading(),
              AuthError(message: tServerFailure.errorMessage),
            ],
        verify: (_) {
          verify(() => updateUser(tUpdateUserParams)).called(1);
          verifyNoMoreInteractions(updateUser);
        });
  });
}
