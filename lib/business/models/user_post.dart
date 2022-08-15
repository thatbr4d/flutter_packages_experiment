import 'package:json_annotation/json_annotation.dart';

part 'user_post.g.dart';

@JsonSerializable()
class UserPost {
  final int userId;
  final int id;
  String title;
  String body;

  UserPost({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);

  Map<String, dynamic> toJson() => _$UserPostToJson(this);
}
