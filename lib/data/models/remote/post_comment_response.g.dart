// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostCommentResponse _$PostCommentResponseFromJson(Map<String, dynamic> json) {
  return PostCommentResponse(
    userId: json['userId'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    body: json['body'] as String?,
  );
}

Map<String, dynamic> _$PostCommentResponseToJson(
        PostCommentResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
