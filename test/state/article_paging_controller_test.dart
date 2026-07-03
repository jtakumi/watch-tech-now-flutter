import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/repository/article_repository.dart';
import 'package:watch_tech_now/state/article_paging_controller.dart';

void main() {
  test(
    'loads pages and stops when the repository reports the last page',
    () async {
      final repository = _FakeArticleRepository();
      final paging = ArticlePagingController(
        repository: repository,
        pageSize: 1,
      );

      paging.fetchNextPage();
      await _waitForFetch(paging);
      paging.fetchNextPage();
      await _waitForFetch(paging);
      paging.fetchNextPage();
      await Future<void>.delayed(Duration.zero);

      expect(repository.requestedPages, [1, 2]);
      expect(
        paging.controller.value.pages?.expand((page) => page),
        hasLength(2),
      );
      expect(paging.controller.value.hasNextPage, isFalse);

      paging.dispose();
    },
  );
}

Future<void> _waitForFetch(ArticlePagingController paging) async {
  while (paging.controller.value.isLoading) {
    await Future<void>.delayed(Duration.zero);
  }
}

final class _FakeArticleRepository implements ArticleRepository {
  final requestedPages = <int>[];

  @override
  ArticleSource get source => ArticleSource.zenn;

  @override
  Future<Article> fetchArticle(String id) => throw UnimplementedError();

  @override
  Future<ArticlePage> fetchArticles({
    required int page,
    required int pageSize,
  }) async {
    requestedPages.add(page);
    return ArticlePage(
      items: [
        Article(
          id: '$page',
          source: source,
          title: 'Article $page',
          url: 'https://example.com/$page',
          authorName: 'Author',
          authorAvatarUrl: 'https://example.com/avatar.png',
          likeCount: page,
          publishedAt: DateTime.utc(2026, 7, page),
        ),
      ],
      hasNextPage: page < 2,
    );
  }
}
