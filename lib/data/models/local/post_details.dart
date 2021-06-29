import 'comment.dart';
import 'post.dart';

class PostDetails {
  PostDetails(this.post, this.comments);

  Post post;
  List<Comment> comments;

  static PostDetails empty() => PostDetails(Post(-1, '', ''), []);
}
