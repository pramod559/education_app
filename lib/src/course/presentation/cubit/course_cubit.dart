import 'package:bloc/bloc.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/src/course/domain/usercases/add_course.dart';
import 'package:education_app/src/course/domain/usercases/get_courses.dart';
import 'package:equatable/equatable.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit({
    required AddCourse addCourse,
    required GetCourses getCourses,
  })  : _addCourse = addCourse,
        _getCourses = getCourses,
        super(CourseInitial());

  final AddCourse _addCourse;
  final GetCourses _getCourses;

  Future<void> addCourse(Course course) async {
    emit(AddingCourse());
    final result = await _addCourse(course);
    result.fold(
      (failure) {
        emit(CourseError(failure.errorMessage));
      },
      (_) => emit(CourseAdded()),
    );
  }

  Future<void> getCourses() async {
    emit(LoadingCourse());
    final result = await _getCourses();
    result.fold(
      (failure) {
        emit(CourseError(failure.errorMessage));
      },
      (courses) {
        emit(CoursesLoaded(courses));
      },
    );
  }

  // String _mapFailureToMessage(Failure failure) {
  //   // Here you can map the failure to a user-friendly error message
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return 'Server Failure';
  //     case CacheFailure:
  //       return 'Cache Failure';
  //     default:
  //       return 'Unexpected Error';
  //   }
  // }
}
