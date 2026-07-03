import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';

typedef RetryDelay = Future<void> Function(Duration duration);

final class RetryInterceptor extends Interceptor {
  RetryInterceptor(
    this._dio, {
    this.maxRetries = 3,
    this.baseDelay = const Duration(milliseconds: 300),
    this.delay = Future<void>.delayed,
  }) : assert(maxRetries >= 0);

  static const _retryAttemptKey = 'retryAttempt';
  static const _idempotentMethods = {'GET', 'HEAD', 'OPTIONS'};
  static const _retryableStatuses = {408, 429, 500, 502, 503, 504};

  final Dio _dio;
  final int maxRetries;
  final Duration baseDelay;
  final RetryDelay delay;

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final attempt = request.extra[_retryAttemptKey] as int? ?? 0;

    if (!_shouldRetry(err) || attempt >= maxRetries) {
      handler.next(err);
      return;
    }

    await delay(_retryDelay(err, attempt));
    request.extra[_retryAttemptKey] = attempt + 1;

    try {
      final response = await _dio.fetch<Object?>(request);
      handler.resolve(response);
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  bool _shouldRetry(DioException error) {
    if (!_idempotentMethods.contains(
      error.requestOptions.method.toUpperCase(),
    )) {
      return false;
    }

    final status = error.response?.statusCode;
    if (status != null) {
      return _retryableStatuses.contains(status);
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError => true,
      _ => false,
    };
  }

  Duration _retryDelay(DioException error, int attempt) {
    final retryAfter = error.response?.headers.value('retry-after');
    final seconds = int.tryParse(retryAfter ?? '');
    if (seconds != null && seconds >= 0) {
      return Duration(seconds: seconds);
    }

    return baseDelay * pow(2, attempt).toInt();
  }
}
