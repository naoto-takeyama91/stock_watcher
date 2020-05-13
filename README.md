# README

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, uniqueness: true|
|password|string|null: false, uniqueness: true|

### Association

- has_many :items
- has_many :item_inventories, through: :item
- has_many :purchase_histories, through: :item

## items table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|image|string||
|url|string||
|term|integer|null: false|

### Association

- belongs_to :user
- has_one :item_inventory
- has_many :purchase_histories
- has_many :categories, through: :item_category
- has_many :item_categories

## item_inventories table

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false|
### Association

- has_one :item
- has_one :user, through: :item

## purchase_histories table

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false, foreign_key: true|

### Association

- belongs_to :item
- has_one :user, through: :item

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
