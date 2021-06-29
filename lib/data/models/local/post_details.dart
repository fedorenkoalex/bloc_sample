import 'comment.dart';
import 'post.dart';

class PostDetails {
  Post post;
  List<Comment> comments;

  PostDetails(this.post, this.comments);

  static PostDetails empty() => PostDetails(Post(-1, "", ""), []);
}
