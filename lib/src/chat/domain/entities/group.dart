import 'package:equatable/equatable.dart';

class Group extends Equatable {
  const Group({
    required this.id,
    required this.name,
    required this.courseId,
    required this.memebers,
    this.lastMessage,
    this.groupImageUrl,
    this.lastMessageTimestamp,
    this.lastMessageSenderName,
  });

  const Group.empty()
      : this(
          id: '',
          name: '',
          courseId: '',
          memebers: const [],
          lastMessage: null,
          groupImageUrl: null,
          lastMessageTimestamp: null,
          lastMessageSenderName: null,
        );
  final String id;
  final String name;
  final String courseId;
  final List<String> memebers;
  final String? lastMessage;
  final String? groupImageUrl;
  final DateTime? lastMessageTimestamp;
  final String? lastMessageSenderName;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, courseId];
}
