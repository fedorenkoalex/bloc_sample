import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc/component/posts_list/bloc/posts_list_bloc.dart';
import 'package:test_bloc/data/models/local/post.dart';
import 'package:test_bloc/navigator/navigation_util.dart';

import 'bloc/posts_list_bloc_state.dart';

class PostsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => PostsListBloc(),
      child: Center(
        child: BlocConsumer<PostsListBloc, PostsListBlocState>(
          builder: (blocContext, blocState) {
            if (blocState.isLoading) {
              return CircularProgressIndicator();
            }
            return ListView.separated(
              itemCount: blocState.posts.length,
              itemBuilder: (context, position) {
                return _createTile(context, blocState.posts[position]);
              },
              separatorBuilder: (context, position) {
                return Divider(
                  height: 1,
                  color: Colors.blueGrey,
                );
              },
            );
          },
          listener: (blocContext, blocState) {
            if (blocState.error != null) {
              _showError(context, blocState.error!);
            }
          },
        ),
      ),
    ));
  }

  _createTile(BuildContext context, Post post) => ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            NavigationUtil.createDetailsRoute(post.id),
          );
        },
        title: Text(
          post.title,
          style: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          post.body,
          style: TextStyle(color: Colors.black, fontSize: 12.0),
        ),
      );

  _showError(BuildContext context, String error) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Error"),
              content: new Text(error),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
