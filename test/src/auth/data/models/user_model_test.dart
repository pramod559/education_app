import 'dart:convert';

import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/data/models/user_model.dart';
import 'package:education_app/src/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

//import '../../../../../analysis_options.yaml';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLocalUserModel = LocalUserModel.empty();

  test('should be a subclass of [LocalUser] entity',
      () => expect(tLocalUserModel, isA<LocalUser>()));

  final tMap = jsonDecode(fixture('user.json')) as DataMap;
  group('fromMap', () {
    test('should return a valid[LocalUserModel] from the map', () {
      //act
      final result = LocalUserModel.fromMap(tMap);
      //assert
//      expect(result, isA<LocalUserModel>());
      expect(result, equals(tLocalUserModel));
    });

    test('should there an [error] when the map is invalid', () {
      final map = DataMap.from(tMap)..remove('uId');
      const call = LocalUserModel.fromMap;

      expect(() => call(map), throwsA(isA<Error>()));
    });
  });

  group('toMap', () {
    test('should return a valid [DataMap] from the model', () {
      final result = tLocalUserModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group('copyWith', () {
    test('should return a valid [LocalUserModel] with updated values', () {
      final result = tLocalUserModel.copyWith(uId: '2');
      expect(result.uId, '2');
    });
  });
}
