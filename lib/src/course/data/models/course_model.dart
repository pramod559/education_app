import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/src/course/domain/entities/course.dart';
import 'package:education_app/core/utils/typedefs.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.title,
    required super.numberOfExams,
    required super.numberOfMaterials,
    required super.numberOfVideos,
    required super.groupId,
    required super.createdAt,
    required super.updatedAt,
    super.description,
    super.image,
    super.imageIsFile = false,
  });
  CourseModel.empty()
      : this(
          id: '_empty.id',
          title: '_empty.title',
          description: '_empty.description',
          numberOfExams: 0,
          numberOfMaterials: 0,
          numberOfVideos: 0,
          groupId: '_empty.groupId',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
  @override
  DataMap toMap() => {
        'id': id,
        'title': title,
        'numberOfExams': numberOfExams,
        'numberOfMaterials': numberOfMaterials,
        'numberOfVideos': numberOfVideos,
        'groupId': groupId,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'description': description,
        'image': image,
        'imageIsFile': imageIsFile,
      };

  CourseModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          title: map['title'] as String,
          numberOfExams: (map['numberOfExams'] as num).toInt(),
          numberOfMaterials: (map['numberOfMaterials'] as num).toInt(),
          numberOfVideos: (map['numberOfVideos'] as num).toInt(),
          groupId: map['groupId'] as String,
          createdAt: (map['createdAt'] as Timestamp).toDate(),
          updatedAt: (map['updatedAt'] as Timestamp).toDate(),
          description: map['description'] as String?,
          image: map['image'] as String?,
          imageIsFile: map['imageIsFile'] ?? false,
        );

  @override
  CourseModel copyWith({
    String? id,
    String? title,
    String? description,
    String? groupId,
    int? numberOfExams,
    int? numberOfMaterials,
    int? numberOfVideos,
    String? image,
    bool? imageIsFile,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      groupId: groupId ?? this.groupId,
      image: image ?? this.image,
      numberOfVideos: numberOfVideos ?? this.numberOfVideos,
      numberOfExams: numberOfExams ?? this.numberOfExams,
      numberOfMaterials: numberOfMaterials ?? this.numberOfMaterials,
      imageIsFile: imageIsFile ?? this.imageIsFile,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
