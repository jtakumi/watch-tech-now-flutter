import 'package:watch_tech_now/model/article.dart';

/// A source-agnostic page returned by an [ArticleRepository].
final class ArticlePage {
  const ArticlePage({required this.items, required this.hasNextPage});

  final List<Article> items;
  final bool hasNextPage;
}

/// Boundary between the application and an article provider.
///
/// Zenn and Qiita implementations map their provider-specific responses to
/// [Article] before returning them through this interface.
abstract interface class ArticleRepository {
  ArticleSource get source;

  Future<ArticlePage> fetchArticles({required int page, required int pageSize});

  Future<Article> fetchArticle(String id);
}
