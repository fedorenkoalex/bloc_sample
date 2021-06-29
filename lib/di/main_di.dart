import 'package:get_it/get_it.dart';
import 'package:test_bloc/di/database.dart';
import 'package:test_bloc/di/repository.dart';
import 'package:test_bloc/di/source.dart';

void registerDi(GetIt getIt) {
  registerSources(getIt);
  registerDatabase(getIt);
  registerRepositories(getIt);
}
