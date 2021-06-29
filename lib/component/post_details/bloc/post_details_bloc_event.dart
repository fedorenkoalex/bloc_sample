abstract class PostDetailsBlocEvent {
  PostDetailsBlocEvent._();

  factory PostDetailsBlocEvent.getPosts(int postId) = GetPostDetailsBlocEvent;
}

class GetPostDetailsBlocEvent extends PostDetailsBlocEvent {
  final int postId;

  GetPostDetailsBlocEvent(this.postId) : super._();
}
