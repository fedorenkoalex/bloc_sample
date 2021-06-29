import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bloc/data/models/local/post_details.dart';
import 'package:test_bloc/data/models/remote_response.dart';
import 'package:test_bloc/data/repository/posts_repository.dart';
import 'post_details_bloc_event.dart';
import 'post_details_bloc_state.dart';

class PostsDetailsBloc
    extends Bloc<PostDetailsBlocEvent, PostDetailsBlocState> {
  final PostsRepository _repository = GetIt.instance<PostsRepository>();

  PostsDetailsBloc(int postId) : super(PostDetailsBlocState.empty()) {
    add(GetPostDetailsBlocEvent(postId));
  }

  @override
  Stream<PostDetailsBlocState> mapEventToState(
      PostDetailsBlocEvent event) async* {
    if (event is GetPostDetailsBlocEvent) {
      yield state.copyWith(isLoading: true);
      var postDetails = await _repository.getPostDetails(event.postId);
      if (postDetails is RemoteResponseSuccess<PostDetails>) {
        yield state.copyWith(
            postDetails: postDetails.data, isLoading: false, error: null);
      } else if (postDetails is RemoteResponseError<PostDetails>) {
        yield state.copyWith(isLoading: false, error: postDetails.message);
      }
    }
  }
}
