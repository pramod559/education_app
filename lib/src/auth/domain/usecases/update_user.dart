import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecasesWithParams<void, UpdateUserParams> {
  final AuthRepo _repo;

  UpdateUser(this._repo);
  @override
  ResultFuture<void> call(UpdateUserParams params) => _repo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  final UpdateUserAction action;
  final dynamic userData;

  const UpdateUserParams({required this.action, required this.userData});

  const UpdateUserParams.empty()
      : this(action: UpdateUserAction.displayName, userData: '');

  @override
  // TODO: implement props
  List<Object?> get props => [action, userData];
}
