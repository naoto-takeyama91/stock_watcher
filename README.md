# README

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, uniqueness: true|
|password|string|null: false, uniqueness: true|

### Association

- has_many :inventories
- has_many :items, through: :inventories
- has_many :purchase_histories

## items table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string||
|url|string||
|term|integer||

### Association

- has_many :inventories
- has_many :users, through: :inventories
- has_many :purchase_histories

## inventories table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false|

### Association

- belongs_to :user
- belongs_to :item

## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items, through: :item_categories
- has_many :item_categories

## item_categories table

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :category

## purchase_histories table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false, foreign_key: true|

### Association


