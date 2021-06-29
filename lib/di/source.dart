

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bloc/data/source/posts_source.dart';

void registerSources(GetIt getIt){
  getIt.registerSingleton<PostsSource>(PostsSource(Dio()));
}