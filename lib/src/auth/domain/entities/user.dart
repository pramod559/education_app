import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  final String uId;
  final String email;
  final String? profilePic;
  final String? bio;
  final int points;
  final String fullName;
  final List<String> groupIds;
  final List<String> enrolledCourseIds;
  final List<String> following;
  final List<String> followers;

  const LocalUser({
    required this.uId,
    required this.email,
    this.profilePic,
    this.bio,
    required this.points,
    required this.fullName,
    this.groupIds = const [],
    this.enrolledCourseIds = const [],
    this.following = const [],
    this.followers = const [],
  });

  const LocalUser.empty()
      : this(
          uId: '',
          email: '',
          points: 0,
          fullName: '',
          profilePic: '',
          bio: '',
          groupIds: const [],
          enrolledCourseIds: const [],
          followers: const [],
          following: const [],
        );

  @override
  // TODO: implement props
  List<Object?> get props => [uId, email];

  @override
  String toString() {
    return 'LocalUser(uId: $uId, email: $email,  bio: $bio,'
        ' points: $points, fullName: $fullName, )';
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': this.uId,
      'email': this.email,
      'profilePic': this.profilePic,
      'bio': this.bio,
      'points': this.points,
      'fullName': this.fullName,
      'groupIds': this.groupIds,
      'enrolledCourseIds': this.enrolledCourseIds,
      'following': this.following,
      'followers': this.followers,
    };
  }
  

  LocalUser copyWith({
    String? uId,
    String? email,
    String? profilePic,
    String? bio,
    int? points,
    String? fullName,
    List<String>? groupIds,
    List<String>? enrolledCourseIds,
    List<String>? following,
    List<String>? followers,
  }) {
    return LocalUser(
      uId: uId ?? this.uId,
      email: email ?? this.email,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      points: points ?? this.points,
      fullName: fullName ?? this.fullName,
      groupIds: groupIds ?? this.groupIds,
      enrolledCourseIds: enrolledCourseIds ?? this.enrolledCourseIds,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }
}
