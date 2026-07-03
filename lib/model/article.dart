import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

enum ArticleSource { zenn, qiita }

@freezed
abstract class Article with _$Article {
  const factory Article({
    required String id,
    required ArticleSource source,
    required String title,
    required String url,
    required String authorName,
    required String authorAvatarUrl,
    required int likeCount,
    required DateTime publishedAt,
    String? emoji,
    String? renderedBody,
  }) = _Article;

  factory Article.fromJson(Map<String, Object?> json) =>
      _$ArticleFromJson(json);
}
