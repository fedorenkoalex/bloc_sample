import 'package:json_annotation/json_annotation.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  PostResponse({this.userId, this.id, this.title, this.body});

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
