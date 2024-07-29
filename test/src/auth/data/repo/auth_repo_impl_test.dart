
//         when(
//           () => authClient.createUserWithEmailAndPassword(
//             email: 'email',
//             password: 'password',
//           ),
//         ).thenAnswer((_) async => userCredential);

//         when(() => authClient.currentUser!.updateDisplayName(any()))
//             .thenAnswer((_) async => Future.value());

// when(()=>cloudStoreClient.collection(any()).doc().get()).thenAnswer(())
//         await dataSource.signUp(
//             email: 'email', fullName: 'fullName', password: 'password');

//         final result = await dataSource.signIn(
//           email: 'email',
//           password: 'password',
//         );

//         expect(authClient.currentUser, isNotNull);
//         expect(authClient.currentUser!.email, 'newEmail@mail.com');
//       },
//     );
//   });
//}











// import 'dart:math';

// import 'package:dartz/dartz.dart';
// import 'package:education_app/core/enums/update_user.dart';
// import 'package:education_app/src/auth/data/data_sources/auth_remote_data_source.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

// void main() async {
//   late FakeFirebaseFirestore cloudStoreClient;
//   late MockFirebaseAuth authClient;
//   late MockFirebaseStorage dbClient;
//   late AuthRemoteDataSource dataSource;
//   // Mock sign in with Google.

//   setUp(() async {
//     cloudStoreClient = FakeFirebaseFirestore();
//     final googleSignIn = MockGoogleSignIn();
//     final signinAccount = await googleSignIn.signIn();
//     final googleAuth = await signinAccount!.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     // Sign in.
//     final mockUser = MockUser(
//       //isAnonymous: false,
//       uid: 'someuid',
//       email: 'bob@somedomain.com',
//       displayName: 'Bob',
//     );
//     authClient = MockFirebaseAuth(mockUser: mockUser);
//     final result = await authClient.signInWithCredential(credential);
//     final user = result.user;
//     dbClient = MockFirebaseStorage();

//     dataSource = AuthRemoteDataSourceImpl(
//         authClient: authClient,
//         cloudStoreClient: cloudStoreClient,
//         dbClient: dbClient);
//   });
//   const tPassword = 'Test Password';
//   const tFullName = 'Test Full Name';
//   const tEmail = 'testemail@email.com';

//   test('signUp', () async {
//     await dataSource.signUp(
//       email: tEmail,
//       fullName: tFullName,
//       password: tPassword,
//     );

//     expect(authClient.currentUser, isNotNull);
//     expect(authClient.currentUser!.displayName, tFullName);

//     final user = await cloudStoreClient
//         .collection('users')
//         .doc(authClient.currentUser!.uid)
//         .get();
//     expect(user.exists, isTrue);
//   });

//   test('signIn', () async {
//     await dataSource.signUp(
//       email: 'newEmail@mail.com',
//       password: tPassword,
//       fullName: tFullName,
//     );
//     print('User signed up successfully.');
//     await authClient.signOut();
//     print('User signed out successfully.');
//     await dataSource.signIn(
//       email: 'newEmail@mail.com',
//       password: tPassword,
//     );
//     print('User signed in successfully.');
// // Assert
//     final currentUser = authClient.currentUser;

//     if (currentUser == null || currentUser.email == null) {
//       fail('User sign-in failed or email is null');
//     }
//     expect(authClient.currentUser, isNotNull);
//     expect(authClient.currentUser!.email, isNotNull);
//     expect(authClient.currentUser!.email, equals('newEmail@mail.com'));
//   });
//   group('updateUser', () {
//     test('displayName', () async {
//       await dataSource.signUp(
//         email: tEmail,
//         fullName: tFullName,
//         password: tPassword,
//       );

//       await dataSource.updateUser(
//         action: UpdateUserAction.displayName,
//         userData: 'new name',
//       );
//       expect(
//         authClient.currentUser!.displayName,
//         'new name',
//       );
//       expect(authClient.currentUser!.displayName, 'new name');
//     });
//     // test('email', () async {
//     //   await dataSource.updateUser(
//     //     action: UpdateUserAction.email,
//     //     userData: 'newemail@mail.com',
//     //   );
//     //   expect(authClient.currentUser!.email, 'newemail@mail.com');
//     // });
//   });
// }




