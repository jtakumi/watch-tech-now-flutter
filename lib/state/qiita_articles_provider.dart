import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_tech_now/data_source/http/http_client.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/repository/article_repository.dart';
import 'package:watch_tech_now/repository/qiita_repository_impl.dart';

const _qiitaBaseUrl = 'https://qiita.com';
const _pageSize = 20;

final qiitaRepositoryProvider = Provider<ArticleRepository>((ref) {
  final client = createHttpClient(baseUrl: _qiitaBaseUrl);
  ref.onDispose(client.close);
  return QiitaRepositoryImpl(client);
});

final qiitaArticlesProvider =
    AsyncNotifierProvider<QiitaArticlesNotifier, List<Article>>(
      QiitaArticlesNotifier.new,
    );

final class QiitaArticlesNotifier extends AsyncNotifier<List<Article>> {
  int _nextPage = 1;
  bool _hasNextPage = true;
  bool _isLoadingMore = false;

  bool get hasNextPage => _hasNextPage;
  bool get isLoadingMore => _isLoadingMore;

  @override
  Future<List<Article>> build() async {
    _nextPage = 1;
    _hasNextPage = true;
    _isLoadingMore = false;
    return _fetchNextPage();
  }

  Future<void> loadMore() async {
    if (!_hasNextPage || _isLoadingMore || state.isLoading) {
      return;
    }
    _isLoadingMore = true;
    ref.notifyListeners();
    try {
      final additionalItems = await _fetchNextPage();
      state = AsyncData([...state.value ?? const [], ...additionalItems]);
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    } finally {
      _isLoadingMore = false;
      ref.notifyListeners();
    }
  }

  Future<List<Article>> _fetchNextPage() async {
    final result = await ref
        .read(qiitaRepositoryProvider)
        .fetchArticles(page: _nextPage, pageSize: _pageSize);
    _hasNextPage = result.hasNextPage;
    _nextPage++;
    return result.items;
  }
}
