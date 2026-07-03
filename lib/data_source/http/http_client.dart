import 'package:dio/dio.dart';
import 'package:watch_tech_now/data_source/http/retry_interceptor.dart';

const _defaultTimeout = Duration(seconds: 15);

Dio createHttpClient({
  String? baseUrl,
  Duration timeout = _defaultTimeout,
  int maxRetries = 3,
  HttpClientAdapter? adapter,
  RetryDelay delay = Future<void>.delayed,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: timeout,
      receiveTimeout: timeout,
      sendTimeout: timeout,
      headers: const {Headers.acceptHeader: Headers.jsonContentType},
    ),
  );

  if (adapter != null) {
    dio.httpClientAdapter = adapter;
  }
  dio.interceptors.add(
    RetryInterceptor(dio, maxRetries: maxRetries, delay: delay),
  );
  return dio;
}
