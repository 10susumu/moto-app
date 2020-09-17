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