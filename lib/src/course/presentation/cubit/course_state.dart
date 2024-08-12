part of 'course_cubit.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object?> get props => [];
}

class CourseInitial extends CourseState {
  const CourseInitial();
}

class LoadingCourse extends CourseState {
  const LoadingCourse();
}

class AddingCourse extends CourseState {
  // final Course course;
  const AddingCourse();
}

class CourseAdded extends CourseState {
  const CourseAdded();
}

class CoursesLoaded extends CourseState {
  final List<Course> courses;
  const CoursesLoaded(
    this.courses,
  );

  @override
  List<Object?> get props => [courses];
}

class CourseError extends CourseState {
  final String message;
  const CourseError(this.message);
  @override
  List<Object?> get props => [message];
}
