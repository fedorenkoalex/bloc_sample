import 'package:test_bloc/data/models/local/post.dart';
import 'package:test_bloc/data/models/remote/post_response.dart';

import 'base_mapper.dart';

class PostsMapper extends BaseMapper<Post, PostResponse> {
  @override
  Post responseToUi(PostResponse response) =>
      Post(response.id ?? -1, response.title ?? "", response.body ?? "");
}
