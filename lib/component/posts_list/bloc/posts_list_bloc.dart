import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bloc/component/posts_list/bloc/posts_list_bloc_event.dart';
import 'package:test_bloc/component/posts_list/bloc/posts_list_bloc_state.dart';
import 'package:test_bloc/data/models/local/post.dart';
import 'package:test_bloc/data/models/remote_response.dart';
import 'package:test_bloc/data/repository/posts_repository.dart';
import 'package:test_bloc/main.dart';

class PostsListBloc extends Bloc<PostsListBlocEvent, PostsListBlocState> {
  final PostsRepository _repository = GetIt.instance<PostsRepository>();

  PostsListBloc() : super(PostsListBlocState.empty()) {
    add(PostsListBlocEvent.getPosts());
  }

  @override
  Stream<PostsListBlocState> mapEventToState(PostsListBlocEvent event) async* {
    if (event is GetPostsBlocEvent) {
      yield state.copyWith(isLoading: true);
      var posts = await _repository.getPosts();
      if (posts is RemoteResponseSuccess<List<Post>>) {
        yield state.copyWith(posts: posts.data, isLoading: false, error: null);
      } else if (posts is RemoteResponseError<List<Post>>) {
        yield state.copyWith(isLoading: false, error: posts.message);
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();

  }

}
