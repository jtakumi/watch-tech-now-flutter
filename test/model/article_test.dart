import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/model/article.dart';

void main() {
  test('serializes and deserializes an article', () {
    final article = Article(
      id: 'article-1',
      source: ArticleSource.zenn,
      title: 'A title',
      url: 'https://example.com/article-1',
      authorName: 'Author',
      authorAvatarUrl: 'https://example.com/avatar.png',
      likeCount: 42,
      publishedAt: DateTime.utc(2026, 7, 3),
      emoji: '🧪',
    );

    expect(Article.fromJson(article.toJson()), article);
  });
}
