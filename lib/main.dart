import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bloc/component/posts_list/posts_list_page.dart';

import 'di/main_di.dart';
import 'navigator/navigation_util.dart';

GetIt getIt = GetIt.instance;

void main() {
  registerDi(getIt);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: NavigationUtil.navigate,
        initialRoute: NavigationUtil.routeInitial);
  }
}
