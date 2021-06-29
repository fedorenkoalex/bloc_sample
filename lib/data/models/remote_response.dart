enum ResponseType { Success, Error }

abstract class RemoteResponse<T> {
  final ResponseType type;

  RemoteResponse._(this.type);

  factory RemoteResponse.success(T data) = RemoteResponseSuccess;

  factory RemoteResponse.error(int code, String message) = RemoteResponseError;

}

class RemoteResponseError<T> extends RemoteResponse<T> {
  RemoteResponseError(this.code, this.message) : super._(ResponseType.Error);

  final int code;
  final String message;
}

class RemoteResponseSuccess<T> extends RemoteResponse<T> {
  RemoteResponseSuccess(this.data) : super._(ResponseType.Success);

  final T data;
}
