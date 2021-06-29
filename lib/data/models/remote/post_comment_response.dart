import 'package:json_annotation/json_annotation.dart';

part 'post_comment_response.g.dart';

@JsonSerializable()
class PostCommentResponse {
  PostCommentResponse({this.userId, this.id, this.name, this.email, this.body});

  factory PostCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$PostCommentResponseFromJson(json);

  int? userId;
  int? id;
  String? name;
  String? email;
  String? body;

  Map<String, dynamic> toJson() => _$PostCommentResponseToJson(this);
}
