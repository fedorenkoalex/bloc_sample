import 'base_mapper.dart';

abstract class BaseDbMapper<T, R, D> extends BaseMapper<T, R> {
  D responseToDb(R response);

  T dbToUi(D dbModel);
}
