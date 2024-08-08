import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/core/utils/typedefs.dart';
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  const Course({
    required this.id,
    required this.title,
    required this.numberOfExams,
    required this.numberOfMaterials,
    required this.numberOfVideos,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.image,
    this.imageIsFile = false,
  });

  Course.empty()
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

  final String id;
  final String title;
  final int numberOfExams;
  final int numberOfMaterials;
  final int numberOfVideos;
  final String groupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final String? image;
  final bool? imageIsFile;

  @override
  List<Object?> get props => [
        id,
        title,
        numberOfExams,
        numberOfMaterials,
        numberOfVideos,
        groupId,
        createdAt,
        updatedAt,
        description,
        image,
        imageIsFile,
      ];

  DataMap toMap() {
    return {
      'id': id,
      'title': title,
      'groupId': groupId,
      'image': image,
      'numberOfExams': numberOfExams,
      'numberOfMaterials': numberOfMaterials,
      'numberOfVideos': numberOfVideos,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
      'description': description,
      'imageIsFile': imageIsFile,
    };
  }

  factory Course.fromMap(DataMap map) {
    return Course(
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
  }

  Course copyWith({
    String? id,
    String? title,
    int? numberOfExams,
    int? numberOfMaterials,
    int? numberOfVideos,
    String? groupId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    String? image,
    bool? imageIsFile,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      numberOfExams: numberOfExams ?? this.numberOfExams,
      numberOfMaterials: numberOfMaterials ?? this.numberOfMaterials,
      numberOfVideos: numberOfVideos ?? this.numberOfVideos,
      groupId: groupId ?? this.groupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      image: image ?? this.image,
      imageIsFile: imageIsFile ?? this.imageIsFile,
    );
  }
}
