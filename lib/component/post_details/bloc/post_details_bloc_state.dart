import 'package:test_bloc/data/models/local/post_details.dart';

class PostDetailsBlocState {
  final PostDetails postDetails;
  final bool isLoading;
  final String? error;

  PostDetailsBlocState(this.postDetails, this.isLoading, this.error);

  PostDetailsBlocState copyWith(
      {PostDetails? postDetails, bool? isLoading, String? error}) {
    return PostDetailsBlocState(postDetails ?? this.postDetails,
        isLoading ?? this.isLoading, error ?? this.error);
  }

  static PostDetailsBlocState empty() {
    return PostDetailsBlocState(PostDetails.empty(), false, null);
  }
}
