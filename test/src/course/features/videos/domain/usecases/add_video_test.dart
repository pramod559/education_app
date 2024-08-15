import 'package:education_app/src/course/features/videos/domain/entities/video.dart';
import 'package:education_app/src/course/features/videos/domain/repos/video_repo.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/add_video.dart';
import 'package:education_app/src/course/features/videos/domain/usecases/get_videos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import 'video_repo.mock.dart';

void main() {
  late VideoRepo repo;
  late AddVideo usecase;

  setUp(() {
    repo = MockVideoRepo();

    usecase = AddVideo(repo);
  });
  final tVideo = Video.empty();
  test('should call [VideoRepo.addVideo]', () async {
    when(() => repo.addVideo(any())).thenAnswer((_) async => const Right(null));

    final result = await usecase(tVideo);
    expect(result, equals(Right<dynamic, void>(null)));
    verify(() => repo.addVideo(tVideo)).called(1);
    verifyNoMoreInteractions(repo);
  });
}
