import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:education_app/src/auth/data/models/user_model.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// class MockFirebaseStorage extends Mock implements FirebaseStorage { }

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  User? _usser;
  @override
  User? get currentUser => null;
  set currentUser(User? value) {
    if (_usser != value) _usser = value;
  }
}
// class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockUser extends Mock implements User {
  String _uid = 'Test uid';

  @override
  String get uid => _uid;

  set uid(String value) {
    if (_uid != value) _uid = value;
  }
}

class MockUserCredential extends Mock implements UserCredential {
  MockUserCredential([User? user]) : _user = user;
  User? _user;

  @override
  User? get user => _user;

  set user(User? value) {
    if (_user != value) _user = value;
  }
}

void main() {
  late FirebaseAuth authClient;
  late FirebaseFirestore cloudStoreClient;
  late FirebaseStorage dbClient;
  late AuthRemoteDataSource dataSource;
  late UserCredential userCredential;
  late DocumentReference<DataMap> documentReference;
  late MockUser mockUser;
  const tUser = LocalUserModel.empty();
  setUp(() async {
    authClient = MockFirebaseAuth();
    cloudStoreClient = FakeFirebaseFirestore();
    documentReference = await cloudStoreClient.collection('users').add(
          tUser.toMap(),
        );
    mockUser = MockUser()..uid = documentReference.id;

    dbClient = MockFirebaseStorage();
    userCredential = MockUserCredential(mockUser);
    dataSource = AuthRemoteDataSourceImpl(
      authClient: authClient,
      cloudStoreClient: cloudStoreClient,
      dbClient: dbClient,
    );

//    when(() => authClient.currentUser).thenReturn(mockUser);
  });

  const tEmail = 'Test email';
  const tPassword = 'Test password';
  const tFullName = 'Test full name';

  group('forgotPassword', () {
    test('should complete successfully when no [Exception ] is thrown',
        () async {
      when(
        () => authClient.sendPasswordResetEmail(
          email: any(named: 'email'),
        ),
      ).thenAnswer(
        (_) => Future.value(),
      );
      final call = dataSource.forgotPassword(tEmail);
      expect(call, completes);

      verify(() => authClient.sendPasswordResetEmail(email: tEmail)).called(1);

      verifyNoMoreInteractions(authClient);
    });
  });

//   group('signIn', () {
//     test(
//       'should complete successfully when call to the server is successful',
//       () async {
//         when(
//           () => authClient.signInWithEmailAndPassword(
//             email: any(named: 'email'),
//             password: any(named: 'password'),
//           ),
//         ).thenAnswer(
//           (_) async => userCredential,
//         );

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
}











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




