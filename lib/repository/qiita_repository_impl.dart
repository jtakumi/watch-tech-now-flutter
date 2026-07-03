import 'package:dio/dio.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/repository/article_repository.dart';

final class QiitaRepositoryImpl implements ArticleRepository {
  QiitaRepositoryImpl(this._client);

  final Dio _client;

  @override
  ArticleSource get source => ArticleSource.qiita;

  @override
  Future<ArticlePage> fetchArticles({
    required int page,
    required int pageSize,
  }) async {
    final response = await _client.get<List<dynamic>>(
      '/api/v2/items',
      queryParameters: {'page': page, 'per_page': pageSize},
    );
    final items = (response.data ?? const <dynamic>[])
        .map((json) => _toArticle(json as Map<String, dynamic>))
        .toList(growable: false);
    return ArticlePage(items: items, hasNextPage: items.length == pageSize);
  }

  @override
  Future<Article> fetchArticle(String id) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/api/v2/items/$id',
    );
    return _toArticle(response.data!);
  }

  Article _toArticle(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>? ?? const {};
    return Article(
      id: json['id'] as String,
      source: source,
      title: json['title'] as String,
      url: json['url'] as String,
      authorName: (user['name'] as String?)?.trim().isNotEmpty == true
          ? user['name'] as String
          : user['id'] as String? ?? 'unknown',
      authorAvatarUrl: user['profile_image_url'] as String? ?? '',
      likeCount: json['likes_count'] as int? ?? 0,
      publishedAt: DateTime.parse(json['created_at'] as String),
      renderedBody: json['rendered_body'] as String?,
    );
  }
}
