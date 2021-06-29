import 'package:test_bloc/data/models/local/post.dart';

class PostsListBlocState {
  PostsListBlocState(this.posts, this.isLoading, this.error);

  final List<Post> posts;
  final bool isLoading;
  final String? error;

  PostsListBlocState copyWith(
      {List<Post>? posts, bool? isLoading, String? error}) {
    return PostsListBlocState(
        posts ?? this.posts, isLoading ?? this.isLoading, error ?? this.error);
  }

  static PostsListBlocState empty() {
    return PostsListBlocState(List.empty(), false, null);
  }
}
