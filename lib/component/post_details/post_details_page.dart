import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/data/models/local/comment.dart';

import 'bloc/post_details_bloc.dart';
import 'bloc/post_details_bloc_state.dart';

class PostDetailsPage extends StatelessWidget {
  PostDetailsPage(this.postId);

  final int postId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BlocProvider(
        create: (context) => PostsDetailsBloc(postId),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocConsumer<PostsDetailsBloc, PostDetailsBlocState>(
              builder: (blocContext, blocState) {
                if (blocState.isLoading) {
                  return const CircularProgressIndicator();
                }
                var post = blocState.postDetails;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.post.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      post.post.body,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text('Comments'),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          return _createTile(post.comments[position]);
                        },
                        separatorBuilder: (context, position) {
                          return const Divider(
                            height: 1,
                            color: Colors.blueGrey,
                          );
                        },
                        itemCount: post.comments.length)
                  ],
                );
              },
              listener: (blocContext, blocState) {
                if (blocState.error != null) {
                  _showError(context, blocState.error!);
                }
              },
            ),
          ),
        ),
      )),
    );
  }

  Widget _createTile(Comment comment) => ListTile(
        title: Text(
          comment.email,
          style: const TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          comment.body,
          style: const TextStyle(color: Colors.black, fontSize: 12.0),
        ),
      );

  void _showError(BuildContext context, String error) {
    showDialog<AlertDialog>(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text(error),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
