import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/repository/qiita_repository_impl.dart';

void main() {
  test('maps a Qiita item to an Article', () async {
    final dio = Dio()..httpClientAdapter = _QiitaAdapter();
    final repository = QiitaRepositoryImpl(dio);

    final page = await repository.fetchArticles(page: 1, pageSize: 20);

    expect(page.items, hasLength(1));
    final article = page.items.single;
    expect(article.id, 'item-id');
    expect(article.title, 'Flutter article');
    expect(article.authorName, 'qiita-user');
    expect(article.likeCount, 12);
    expect(article.publishedAt, DateTime.parse('2026-07-03T01:02:03+09:00'));
    expect(page.hasNextPage, isFalse);
  });
}

final class _QiitaAdapter implements HttpClientAdapter {
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.path, '/api/v2/items');
    expect(options.queryParameters, {'page': 1, 'per_page': 20});
    return ResponseBody.fromString(
      '''
      [{
        "id": "item-id",
        "title": "Flutter article",
        "url": "https://qiita.com/qiita-user/items/item-id",
        "likes_count": 12,
        "created_at": "2026-07-03T01:02:03+09:00",
        "user": {
          "id": "qiita-user",
          "name": "",
          "profile_image_url": "https://example.com/avatar.png"
        }
      }]
      ''',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
