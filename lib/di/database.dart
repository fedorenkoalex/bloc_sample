

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_bloc/data/database/app_database.dart';
import 'package:test_bloc/data/source/posts_source.dart';

void registerDatabase(GetIt getIt){
  getIt.registerSingleton<AppDatabase>(AppDatabase());
}