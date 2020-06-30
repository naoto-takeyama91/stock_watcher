# README

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association

- has_many :items
- has_many :item_inventories, through: :item
- has_many :purchase_histories, through: :item

## items table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|image|string||
|url|string||
|term|integer|null: false|

### Association

- belongs_to :user
- has_one :item_inventory
- has_many :purchase_histories

## item_inventories table

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false|
### Association

- belongs_to :item
- has_one :user, through: :item

## purchase_histories table

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|amount|integer|null: false|

### Association

- belongs_to :item
- has_one :user, through: :item
