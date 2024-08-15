import 'package:education_app/core/common/widgets/conurse_info_tile.dart';
import 'package:education_app/core/common/widgets/expandable_text.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/extensions/int_extentions.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/course/data/models/course_model.dart';
import 'package:education_app/src/course/domain/entities/course.dart';

import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen(this.course, {super.key});

  static const routeName = '/course-details';
  final Course course;

  @override
  Widget build(BuildContext context) {
    final course = (this.course as CourseModel).copyWith(
      numberOfVideos: 2,
      numberOfExams: 3,
      numberOfMaterials: 30,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: GradientBackground(
          image: MediaRes.homeGradientBackground,
          child: SafeArea(
              child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(
                height: context.height * .3,
                child: Center(
                  child: course.image != null
                      ? Image.network(course.image!)
                      : Image.asset(MediaRes.casualMeditation),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (course.description != null)
                    ExpandableText(context, text: course.description!),
                  if (course.numberOfMaterials > 0 ||
                      course.numberOfVideos > 0 ||
                      course.numberOfExams > 0) ...[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Subject Details ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (course.numberOfVideos > 0) ...[
                      SizedBox(
                        height: 10,
                      ),
                      ConrseInfoTile(
                        image: MediaRes.courseInfoVideo,
                        title: '${course.numberOfVideos} Video(s)',
                        subtitle:
                            'Watch our tutorial videos for ${course.title}',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/unknown-route',
                          arguments: course,
                        ),
                      ),
                    ],
                    if (course.numberOfExams > 0) ...[
                      SizedBox(height: 10),
                      ConrseInfoTile(
                          image: MediaRes.courseInfoExam,
                          title: '${course.numberOfExams} Exam(s)',
                          subtitle: 'Take our exams for ${course.title}',
                          onTap: () => Navigator.of(context).pushNamed(
                                '/unknown-route',
                                arguments: course,
                              )),
                    ],
                    if (course.numberOfMaterials > 0) ...[
                      SizedBox(height: 10),
                      ConrseInfoTile(
                        image: MediaRes.courseInfoMaterial,
                        title: '${course.numberOfMaterials} Material(s)',
                        subtitle:
                            'Access to ${course.numberOfMaterials.estimate}'
                            ' materials for ${course.title}',
                        onTap: () => Navigator.of(context).pushNamed(
                          '/unknown-route',
                          arguments: course,
                        ),
                      ),
                    ]
                  ]
                ],
              )
            ],
          ))),
    );
  }
}
