# アプリ名 MotoApp
# アプリの機能
投稿機能
投稿の詳細
コメント機能
# 本番環境
https://moto-app28236.herokuapp.com/
basic認証 : susumu
pass     : 2222

# 制作背景
バイクに乗る人の為にSNSアプリを考えました。
投稿機能には、写真の投稿に加えGoogleMapAPIを使用し、
地図情報を投稿する機能を追加しました。
これによりツーリングで訪れた場所と写真が紐付けられます。
またユーザー同士の交流のためコメント機能を実装しています。

# DEMO
![top]https://gyazo.com/65d06f6403bcae672aec47ee2c010474
![show]https://gyazo.com/e4583f5ccbead91e6014492775c8a283

## user table
|Column|Type|Options|
|---|---|---|
|nickname|string|null: false|
|profile|text|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :contents
- has_many :comments
- has_many :chats
- has_one_attached :avatar

## content table
|Column|Type|Options|
|---|---|---|
|user|references|null: false, foreign_key: true|
|text|string|null: false|
|map|string|null: false|
### Association
- has_many :comments
- belongs_to :user
- has_one_attached :image

## comment table
|Column|Type|Options|
|---|---|---|
|user|references|null: false, foreign_key: true|
|content|references|null: false, foreign_key: true|
|text|string|null: false|
### Association
- belongs_to :user
- belongs_to :content

## chat table
|Column|Type|Options|
|---|---|---|
|master_user_id|integer|null: false|
|user|references|null: false, foreign_key: true|
|text|string|null: false|
### Association
- belongs_to :user