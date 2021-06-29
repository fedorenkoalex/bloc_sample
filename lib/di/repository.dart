import 'package:get_it/get_it.dart';
import 'package:test_bloc/data/database/app_database.dart';
import 'package:test_bloc/data/repository/posts_repository.dart';
import 'package:test_bloc/data/source/posts_source.dart';

void registerRepositories(GetIt getIt) {
  getIt.registerSingleton<PostsRepository>(
      PostsRepository(getIt<PostsSource>(), getIt<AppDatabase>()));
}
