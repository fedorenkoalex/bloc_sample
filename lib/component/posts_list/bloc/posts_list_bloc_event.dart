abstract class PostsListBlocEvent {
  PostsListBlocEvent._();

  factory PostsListBlocEvent.getPosts() = GetPostsBlocEvent;
}

class GetPostsBlocEvent extends PostsListBlocEvent {
  GetPostsBlocEvent() : super._();
}
