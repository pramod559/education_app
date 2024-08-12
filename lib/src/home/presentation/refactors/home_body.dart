import 'package:education_app/core/common/views/loading_view.dart';
import 'package:education_app/core/common/widgets/not_found_text.dart';
import 'package:education_app/core/extensions/context_extension.dart';
import 'package:education_app/core/utils/core_utils.dart';
import 'package:education_app/src/course/presentation/cubit/course_cubit.dart';
import 'package:education_app/src/home/presentation/refactors/home_header.dart';
import 'package:education_app/src/home/presentation/refactors/home_subjects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void getCourses() {
    context.read<CourseCubit>().getCourses();
  }

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(listener: (_, state) {
      if (state is CourseError) {
        CoreUtils.showSnackBar(context, state.message);
      } else if (state is CoursesLoaded && state.courses.isNotEmpty) {
        final courses = state.courses..shuffle();
        final courseOfTheDay = courses.first;
        context.read().setCourseOfTheDay(courseOfTheDay);
      }
    }, builder: (context, state) {
      if (state is LoadingCourse) {
        return LoadingView();
      } else if (state is CoursesLoaded && state.courses.isEmpty ||
          state is CourseError) {
        return NotFoundText(
            'No courses found\nPlease contact admin or if you are admin'
            ' add courses');
      } else if (state is CoursesLoaded) {
        final courses = state.courses
          ..sort(
            (a, b) => b.updatedAt.compareTo(a.updatedAt),
          );
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            HomeHeader(),
            SizedBox(height: 20),
            HomeSubjects(courses: courses),
          ],
        );
      }
      return SizedBox.shrink ();
    });
  }
}
