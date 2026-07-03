// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Article _$ArticleFromJson(Map<String, dynamic> json) => _Article(
  id: json['id'] as String,
  source: $enumDecode(_$ArticleSourceEnumMap, json['source']),
  title: json['title'] as String,
  url: json['url'] as String,
  authorName: json['authorName'] as String,
  authorAvatarUrl: json['authorAvatarUrl'] as String,
  likeCount: (json['likeCount'] as num).toInt(),
  publishedAt: DateTime.parse(json['publishedAt'] as String),
  emoji: json['emoji'] as String?,
  renderedBody: json['renderedBody'] as String?,
);

Map<String, dynamic> _$ArticleToJson(_Article instance) => <String, dynamic>{
  'id': instance.id,
  'source': _$ArticleSourceEnumMap[instance.source]!,
  'title': instance.title,
  'url': instance.url,
  'authorName': instance.authorName,
  'authorAvatarUrl': instance.authorAvatarUrl,
  'likeCount': instance.likeCount,
  'publishedAt': instance.publishedAt.toIso8601String(),
  'emoji': instance.emoji,
  'renderedBody': instance.renderedBody,
};

const _$ArticleSourceEnumMap = {
  ArticleSource.zenn: 'zenn',
  ArticleSource.qiita: 'qiita',
};
