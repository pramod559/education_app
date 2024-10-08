import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:flutter/foundation.dart';

class CourseOfTheDayNotifier extends ChangeNotifier {
  Course? _courseOfTheDay;

  Course? get courseOftheDay => _courseOfTheDay;

  void setCourseOfTheDay(Course course) {
    _courseOfTheDay ??= course;

    notifyListeners();
  }
}
