import 'package:education_app/core/res/media_res.dart';
import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  final String image;
  final String title;
  final String description;

  PageContent(
      {required this.image, required this.title, required this.description});

  PageContent.first()
      : this(
          image: MediaRes.casualReading,
          title: 'Brand new curriculum',
          description:
              'This is the first online education platform designed by the'
              "world's top professors",
        );
  PageContent.second()
      : this(
          image: MediaRes.casualLife,
          title: 'Brand a fun atmosphere',
          description:
              'This is the first online education platform designed by the'
              "world's top professors",
        );
  PageContent.third()
      : this(
          image: MediaRes.casualMeditationScience,
          title: 'Easy to join the lesson',
          description:
              'This is the first online education platform designed by the'
              "world's top professors",
        );

  @override
  // TODO: implement props
  List<Object?> get props => [image,title,description];
}
