import 'package:education_app/core/common/widgets/course_tile.dart';
import 'package:education_app/core/common/widgets/gradient_background.dart';
import 'package:education_app/core/res/media_res.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/presentation/views/course_details_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AllCoursesView extends StatelessWidget {
  AllCoursesView(
    this.courses, {
    super.key,
  });

  final List<Course> courses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: GradientBackground(
          image: MediaRes.homeGradientBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'All Subjects',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 40,
                  runAlignment: WrapAlignment.spaceEvenly,
                  children: courses
                      .map((course) => CourseTile(
                            course: course,
                            onTap: () => Navigator.of(context).pushNamed(
                              CourseDetailsScreen.routeName,
                              arguments: course,
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          )),
    );
  }
}
