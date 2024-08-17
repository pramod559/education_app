import 'package:education_app/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatasourseUtils {
  const DatasourseUtils._();

  static Future<void> authorizeUser(FirebaseAuth auth) async {
    final user = auth.currentUser;
    if (user == null) {
      throw ServerException(
          message: 'User is not authenticated ', statusCode: '401');
    }
  }
}
