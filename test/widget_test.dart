import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/presentation/app.dart';
import 'package:watch_tech_now/repository/article_repository.dart';
import 'package:watch_tech_now/state/qiita_articles_provider.dart';

void main() {
  testWidgets('shows the app title', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          qiitaRepositoryProvider.overrideWithValue(_FakeQiitaRepository()),
        ],
        child: const WatchTechNowApp(),
      ),
    );
    await tester.pump();

    expect(find.text('Watch Tech Now'), findsOneWidget);
  });
}

final class _FakeQiitaRepository implements ArticleRepository {
  @override
  ArticleSource get source => ArticleSource.qiita;

  @override
  Future<Article> fetchArticle(String id) => throw UnimplementedError();

  @override
  Future<ArticlePage> fetchArticles({
    required int page,
    required int pageSize,
  }) async {
    return const ArticlePage(items: [], hasNextPage: false);
  }
}
