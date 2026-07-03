import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:watch_tech_now/model/article.dart';
import 'package:watch_tech_now/state/qiita_articles_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMoreNearBottom);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_loadMoreNearBottom)
      ..dispose();
    super.dispose();
  }

  void _loadMoreNearBottom() {
    if (_scrollController.position.extentAfter < 400) {
      ref.read(qiitaArticlesProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final articles = ref.watch(qiitaArticlesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Watch Tech Now')),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(qiitaArticlesProvider.future),
        child: articles.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) =>
              _ErrorView(onRetry: () => ref.invalidate(qiitaArticlesProvider)),
          data: (items) => items.isEmpty
              ? const _EmptyView()
              : ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount:
                      items.length +
                      (ref.watch(qiitaArticlesProvider.notifier).isLoadingMore
                          ? 1
                          : 0),
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    if (index == items.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return _ArticleCard(article: items[index]);
                  },
                ),
        ),
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  const _ArticleCard({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final date = article.publishedAt.toLocal();
    final dateLabel =
        '${date.year}/${date.month.toString().padLeft(2, '0')}/'
        '${date.day.toString().padLeft(2, '0')}';
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff55c500),
                  foregroundImage: article.authorAvatarUrl.isEmpty
                      ? null
                      : CachedNetworkImageProvider(article.authorAvatarUrl),
                  child: article.authorAvatarUrl.isEmpty
                      ? const Text('Q')
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.authorName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Qiita · $dateLabel',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              article.title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.favorite_border, size: 18),
                const SizedBox(width: 4),
                Text('${article.likeCount}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 160),
        const Icon(Icons.cloud_off, size: 48),
        const SizedBox(height: 12),
        const Center(child: Text('記事を読み込めませんでした')),
        Center(
          child: TextButton(onPressed: onRetry, child: const Text('再読み込み')),
        ),
      ],
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(height: 180),
        Center(child: Text('記事がありません')),
      ],
    );
  }
}
