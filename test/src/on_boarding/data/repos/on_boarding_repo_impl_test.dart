import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/exceptions.dart';
import 'package:education_app/core/errors/failures.dart';
import 'package:education_app/src/on_boarding/data/dataSources/on_boarding_local_data_source.dart';
import 'package:education_app/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file/open_file.dart';

class MockOnBoardingLocalDataSrc extends Mock
    implements OnBoardingLocalDataSource {}

void main() {
  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImpl repoImpl;

  setUp(() {
    localDataSource = MockOnBoardingLocalDataSrc();
    repoImpl = OnBoardingRepoImpl(localDataSource);
  });
  test('should be a subclass of [OnBoardingRepo]', () {
    expect(repoImpl, isA<OnBoardingRepoImpl>());
  });

  group('cacheFirstTimer', () {
    test('should complete successfully when call to local source is successful',
        () async {
      when(() => localDataSource.cacheFirstTimer())
          .thenAnswer((_) async => Future.value());
      final result = await repoImpl.cacheFirstTimer();

      expect(result, equals(Right<dynamic, void>(null)));

      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });

    test(
        'should return [CacheFailure] when call to local source is'
        ' unsuccessful', () async {
      when(() => localDataSource.cacheFirstTimer()).thenThrow(
        CacheException(message: 'Insufficient storage'),
      );

      final result = await repoImpl.cacheFirstTimer();

      expect(
        result,
        Left<CacheFailure, dynamic>(
          CacheFailure(message: 'Insufficient storage', statusCode: 500),
        ),
      );
      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);
    });
  });

  group('checkIfUserIsFirstTimer', () {
    test(
      'should return true when user is first timer',
      () async {
        when(() => localDataSource.checkIfUserIsFirstTimer())
            .thenAnswer((_) async => await Future.value(true));

        final result = await repoImpl.checkIfUserIsFirstTimer();

        expect(result, equals(Right<dynamic, bool>(true)));

        verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(localDataSource);
      },
    );
    test('should return false when user is first timer', () async {
      when(() => localDataSource.checkIfUserIsFirstTimer())
          .thenAnswer((_) async => await Future.value(false));

      final result = await repoImpl.checkIfUserIsFirstTimer();

      expect(result, equals(Right<dynamic, bool>(false)));

      verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

      verifyNoMoreInteractions(localDataSource);
    });
    test(
      'should return a CacheFailure when call to local data source'
      'is Unsuccessful',
      () async {
        when(() => localDataSource.checkIfUserIsFirstTimer())
            .thenThrow(CacheException(
          message: 'Insufficent permissions',
          statusCode: 403,
        ));

        final result = await repoImpl.checkIfUserIsFirstTimer();

        expect(
            result,
            equals(Left<CacheFailure, bool>(CacheFailure(
                message: 'Insufficent permissions', statusCode: 403))));

        verify(() => localDataSource.checkIfUserIsFirstTimer()).called(1);

        verifyNoMoreInteractions(localDataSource);
      },
    );
  });
}
