## user table
|Column|Type|Options|
|---|---|---|
|nickname|string|nil: false|
|email|string|nil: false|
|password|string|nil: false|
### Association
- has_many :contents
- has_many :comment

## content table
|Column|Type|Options|
|---|---|---|
|user|references|nil: false, foreign_key: true|
|image|string|nil: false|
|text|string|nil: false|
|map|string|nil: false|
### Association
- has_many :comment
