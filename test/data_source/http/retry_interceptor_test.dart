import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/data_source/http/http_client.dart';

void main() {
  test('retries an idempotent request after a transient response', () async {
    final adapter = _SequenceAdapter([503, 200]);
    final delays = <Duration>[];
    final dio = createHttpClient(
      adapter: adapter,
      delay: (duration) async => delays.add(duration),
    );

    final response = await dio.get<Object?>('/articles');

    expect(response.statusCode, 200);
    expect(adapter.requestCount, 2);
    expect(delays, [const Duration(milliseconds: 300)]);
  });

  test('does not retry a non-idempotent request', () async {
    final adapter = _SequenceAdapter([503, 200]);
    final dio = createHttpClient(adapter: adapter, delay: (_) async {});

    await expectLater(
      dio.post<Object?>('/articles'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.requestCount, 1);
  });
}

final class _SequenceAdapter implements HttpClientAdapter {
  _SequenceAdapter(this.statuses);

  final List<int> statuses;
  int requestCount = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final status = statuses[requestCount++];
    return ResponseBody.fromString(
      '{}',
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
