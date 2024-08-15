import 'dart:convert';

import 'package:equatable/equatable.dart';

class Video extends Equatable {
  const Video({
    required this.id,
    this.thumbnail,
    required this.videoURL,
    this.title,
    this.tutor,
    required this.courseId,
    required this.uploadDate,
    this.thumbnailIsFile = false,
  });

  Video.empty()
      : this(
          id: '_empty.id',
          videoURL: '_empty.videoURL',
          uploadDate: DateTime.now(),
          courseId: '_empty.courseId',
        );

  final String id;
  final String? thumbnail;
  final String videoURL;
  final String? title;
  final String? tutor;
  final String courseId;
  final DateTime uploadDate;
  final bool thumbnailIsFile;
  @override
  List<Object?> get props => [id];

  Video copyWith({
    String? id,
    String? thumbnail,
    String? videoURL,
    String? title,
    String? tutor,
    String? courseId,
    DateTime? uploadDate,
    bool? thumbnailIsFile,
  }) {
    return Video(
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
      videoURL: videoURL ?? this.videoURL,
      title: title ?? this.title,
      tutor: tutor ?? this.tutor,
      courseId: courseId ?? this.courseId,
      uploadDate: uploadDate ?? this.uploadDate,
      thumbnailIsFile: thumbnailIsFile ?? this.thumbnailIsFile,
    );
  }

  
}
