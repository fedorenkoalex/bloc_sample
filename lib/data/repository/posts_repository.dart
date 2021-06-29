import 'package:dio/dio.dart';
import 'package:test_bloc/data/database/app_database.dart';
import 'package:test_bloc/data/models/local/comment.dart';
import 'package:test_bloc/data/models/local/post.dart';
import 'package:test_bloc/data/models/local/post_details.dart';
import 'package:test_bloc/data/models/mapper/base_mapper.dart';
import 'package:test_bloc/data/models/mapper/comments_mapper.dart';
import 'package:test_bloc/data/models/mapper/posts_mapper.dart';
import 'package:test_bloc/data/models/remote/post_comment_response.dart';
import 'package:test_bloc/data/models/remote/post_response.dart';
import 'package:test_bloc/data/models/remote_response.dart';
import 'package:test_bloc/data/source/posts_source.dart';

class PostsRepository {
  PostsRepository(this._postsSource, this._postsDatabase);

  final PostsSource _postsSource;
  final AppDatabase _postsDatabase;
  final BaseMapper<Post, PostResponse> _postMapper = PostsMapper();
  final BaseMapper<Comment, PostCommentResponse> _commentMapper =
      CommentsMapper();

  Future<RemoteResponse<List<Post>>> getPosts() async {
    try {
      var cachedPosts = await _postsDatabase.getPosts();
      print('Got ${cachedPosts.length} posts from DB');
      if (cachedPosts.isNotEmpty) {
        return RemoteResponse.success(cachedPosts);
      }
      var response = await _postsSource.getPosts();
      var uiPosts = response.map(_postMapper.responseToUi).toList();
      await _postsDatabase.savePosts(uiPosts);
      return RemoteResponse.success(uiPosts);
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, 'Internal error');
    }
  }

  Future<RemoteResponse<PostDetails>> getPostDetails(int postId) async {
    try {
      var postModel = await _postsDatabase.getPost(postId);
      var commentsResponse = await _postsSource.getPostComments(postId);
      var commentsUi =
          commentsResponse.map(_commentMapper.responseToUi).toList();
      return RemoteResponse.success(PostDetails(postModel, commentsUi));
    } on DioError catch (error) {
      return RemoteResponse.error(error.type.index, error.message);
    } on Exception catch (exception) {
      return RemoteResponse.error(-1, 'Internal error');
    }
  }
}
