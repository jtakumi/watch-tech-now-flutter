// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Article {

 String get id; ArticleSource get source; String get title; String get url; String get authorName; String get authorAvatarUrl; int get likeCount; DateTime get publishedAt; String? get emoji; String? get renderedBody;
/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleCopyWith<Article> get copyWith => _$ArticleCopyWithImpl<Article>(this as Article, _$identity);

  /// Serializes this Article to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Article&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.renderedBody, renderedBody) || other.renderedBody == renderedBody));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,title,url,authorName,authorAvatarUrl,likeCount,publishedAt,emoji,renderedBody);

@override
String toString() {
  return 'Article(id: $id, source: $source, title: $title, url: $url, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, likeCount: $likeCount, publishedAt: $publishedAt, emoji: $emoji, renderedBody: $renderedBody)';
}


}

/// @nodoc
abstract mixin class $ArticleCopyWith<$Res>  {
  factory $ArticleCopyWith(Article value, $Res Function(Article) _then) = _$ArticleCopyWithImpl;
@useResult
$Res call({
 String id, ArticleSource source, String title, String url, String authorName, String authorAvatarUrl, int likeCount, DateTime publishedAt, String? emoji, String? renderedBody
});




}
/// @nodoc
class _$ArticleCopyWithImpl<$Res>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._self, this._then);

  final Article _self;
  final $Res Function(Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? title = null,Object? url = null,Object? authorName = null,Object? authorAvatarUrl = null,Object? likeCount = null,Object? publishedAt = null,Object? emoji = freezed,Object? renderedBody = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ArticleSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,renderedBody: freezed == renderedBody ? _self.renderedBody : renderedBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Article].
extension ArticlePatterns on Article {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Article value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Article value)  $default,){
final _that = this;
switch (_that) {
case _Article():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Article value)?  $default,){
final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ArticleSource source,  String title,  String url,  String authorName,  String authorAvatarUrl,  int likeCount,  DateTime publishedAt,  String? emoji,  String? renderedBody)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that.id,_that.source,_that.title,_that.url,_that.authorName,_that.authorAvatarUrl,_that.likeCount,_that.publishedAt,_that.emoji,_that.renderedBody);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ArticleSource source,  String title,  String url,  String authorName,  String authorAvatarUrl,  int likeCount,  DateTime publishedAt,  String? emoji,  String? renderedBody)  $default,) {final _that = this;
switch (_that) {
case _Article():
return $default(_that.id,_that.source,_that.title,_that.url,_that.authorName,_that.authorAvatarUrl,_that.likeCount,_that.publishedAt,_that.emoji,_that.renderedBody);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ArticleSource source,  String title,  String url,  String authorName,  String authorAvatarUrl,  int likeCount,  DateTime publishedAt,  String? emoji,  String? renderedBody)?  $default,) {final _that = this;
switch (_that) {
case _Article() when $default != null:
return $default(_that.id,_that.source,_that.title,_that.url,_that.authorName,_that.authorAvatarUrl,_that.likeCount,_that.publishedAt,_that.emoji,_that.renderedBody);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Article implements Article {
  const _Article({required this.id, required this.source, required this.title, required this.url, required this.authorName, required this.authorAvatarUrl, required this.likeCount, required this.publishedAt, this.emoji, this.renderedBody});
  factory _Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

@override final  String id;
@override final  ArticleSource source;
@override final  String title;
@override final  String url;
@override final  String authorName;
@override final  String authorAvatarUrl;
@override final  int likeCount;
@override final  DateTime publishedAt;
@override final  String? emoji;
@override final  String? renderedBody;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleCopyWith<_Article> get copyWith => __$ArticleCopyWithImpl<_Article>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Article&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.renderedBody, renderedBody) || other.renderedBody == renderedBody));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,source,title,url,authorName,authorAvatarUrl,likeCount,publishedAt,emoji,renderedBody);

@override
String toString() {
  return 'Article(id: $id, source: $source, title: $title, url: $url, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, likeCount: $likeCount, publishedAt: $publishedAt, emoji: $emoji, renderedBody: $renderedBody)';
}


}

/// @nodoc
abstract mixin class _$ArticleCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$ArticleCopyWith(_Article value, $Res Function(_Article) _then) = __$ArticleCopyWithImpl;
@override @useResult
$Res call({
 String id, ArticleSource source, String title, String url, String authorName, String authorAvatarUrl, int likeCount, DateTime publishedAt, String? emoji, String? renderedBody
});




}
/// @nodoc
class __$ArticleCopyWithImpl<$Res>
    implements _$ArticleCopyWith<$Res> {
  __$ArticleCopyWithImpl(this._self, this._then);

  final _Article _self;
  final $Res Function(_Article) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? title = null,Object? url = null,Object? authorName = null,Object? authorAvatarUrl = null,Object? likeCount = null,Object? publishedAt = null,Object? emoji = freezed,Object? renderedBody = freezed,}) {
  return _then(_Article(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ArticleSource,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: null == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,publishedAt: null == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,emoji: freezed == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String?,renderedBody: freezed == renderedBody ? _self.renderedBody : renderedBody // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
