// import 'package:dartz/dartz.dart';
// import 'package:education_app/src/auth/domain/entities/user.dart';
// import 'package:education_app/src/auth/domain/usecases/update_user.dart';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:education_app/core/enums/update_user.dart';

// import 'auth_repo.mock.dart';

// void main() {
//   late MockAuthRepo repo;
//   late UpdateUser usecase;

//   const tAction = action;
//   const tUserData = LocalUser(
//     uId: 'Test user id',
//     email: 'Test email',
//     fullName: 'Test fullname',
//     profilePic: '',
//     bio: '',
//     points: 0,
//     groupId: [],
//     enrolledCourceIds: [],
//     following: [],
//     followers: [],
//   );

//   setUp(() {
//     repo = MockAuthRepo();
//     usecase = UpdateUser(repo);
//   });

//   const tUser = LocalUser.empty();
//   test(
//     'should return [LocalUser] from the [AuthRepo]',
//     () async {
//       when(
//         () => repo.updateUser(
//           action: any(named: 'action'),
//           userData: any(named: 'userData'),
//         ),
//       ).thenAnswer((_) async => const Right(tUser));

//       final result = await usecase(const UpdateUserParams(
//         action: tAction,
//         userData: tUserData,
//       ));
//       expect(result, const Right<dynamic, LocalUser>(tUser));
//       verify(
//         () => repo.updateUser(
//           action: tAction,
//           userData: tUserData,
//         ),
//       ).called(1);
//       verifyNoMoreInteractions(repo);
//     },
//   );
// }
