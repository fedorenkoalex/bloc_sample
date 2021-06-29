import 'package:flutter/material.dart';
import 'package:test_bloc/component/post_details/post_details_page.dart';
import 'package:test_bloc/component/posts_list/posts_list_page.dart';

class NavigationUtil {
  static const String routeInitial = "/";
  static const String routeDetails = "details";

  static MaterialPageRoute? navigate(RouteSettings route) {
    if (route.name == null) {
      return null;
    }
    if (_isInitial(route.name!)) {
      return MaterialPageRoute(builder: (context) => PostsListPage());
    }
    var uri = Uri.parse(route.name!);
    if (_isRoute(uri, routeDetails)) {
      var postId = uri.pathSegments[1];
      return MaterialPageRoute(
          builder: (context) => PostDetailsPage(int.parse(postId)));
    }
  }

  static String createDetailsRoute(int postId) => "$routeDetails/$postId";

  static bool _isRoute(Uri route, String match) =>
      route.pathSegments.length == 2 && route.pathSegments.first == match;

  static bool _isInitial(String match) => match == routeInitial;
}
