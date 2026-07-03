import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/repository/article_repository.dart';

/// Keeps pagination policy out of UI widgets.
final class ArticlePagingController {
  ArticlePagingController({
    required ArticleRepository repository,
    this.pageSize = 20,
  }) : assert(pageSize > 0) {
    controller = PagingController<int, Article>(
      getNextPageKey: (state) {
        if (!state.hasNextPage) {
          return null;
        }
        return (state.keys?.last ?? 0) + 1;
      },
      fetchPage: (page) async {
        final result = await repository.fetchArticles(
          page: page,
          pageSize: pageSize,
        );
        controller.value = controller.value.copyWith(
          hasNextPage: result.hasNextPage,
        );
        return result.items;
      },
    );
  }

  final int pageSize;
  late final PagingController<int, Article> controller;

  bool _disposed = false;

  void fetchNextPage() => controller.fetchNextPage();

  void refresh() => controller.refresh();

  void dispose() {
    if (_disposed) {
      return;
    }
    _disposed = true;
    controller.dispose();
  }
}
