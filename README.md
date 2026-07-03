# watch-tech-now-flutter

Qiita・Zenn のテック記事を閲覧するモバイルアプリ（Flutter 製）。

## 特徴

- Qiita の記事一覧を取得して表示（無限スクロールによる追加読み込み対応）
- Pull-to-refresh によるリロード
- 記事ソースを抽象化した `ArticleRepository` により、Qiita / Zenn を差し替え可能な設計
- タイムアウト・自動リトライを備えた HTTP クライアント

## 技術スタック

- **Flutter / Dart** (Dart SDK `^3.12.2`)
- **状態管理**: Riverpod (`flutter_riverpod`)
- **ルーティング**: go_router
- **HTTP**: dio（リトライインターセプター付き）
- **モデル生成**: freezed / json_serializable
- **画像キャッシュ**: cached_network_image
- **HTML 表示**: flutter_widget_from_html / webview_flutter

## プロジェクト構成

```
lib/
├── main.dart                     # エントリポイント（ProviderScope）
├── presentation/                 # 画面・ウィジェット
│   ├── app.dart                  # MaterialApp / go_router 定義
│   └── home/home_page.dart       # 記事一覧画面
├── model/                        # Article モデル（freezed）
├── repository/                   # ArticleRepository と Qiita 実装
├── state/                        # Riverpod プロバイダ／ページング
└── data_source/http/             # dio クライアントとリトライ処理
```

## セットアップ

```bash
# 依存パッケージの取得
flutter pub get

# コード生成（freezed / json_serializable）
dart run build_runner build --delete-conflicting-outputs

# 実行
flutter run
```

## テスト

```bash
flutter test
```

## アーキテクチャ概要

- `ArticleRepository` がアプリと記事プロバイダの境界となり、各サービス固有の
  レスポンスを共通の `Article` モデルへマッピングする。
- `QiitaRepositoryImpl` が Qiita API v2 (`/api/v2/items`) を呼び出す。
- `QiitaArticlesNotifier`（`AsyncNotifier`）がページングと追加読み込みを管理する。
- HTTP 通信は `createHttpClient` が生成する dio インスタンスが担い、
  `RetryInterceptor` で一時的な失敗を自動リトライする。
