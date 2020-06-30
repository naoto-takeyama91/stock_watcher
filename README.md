# StockWatch

![logo](/public/stock_watch_logo.png)

# 概要

[StockWatch](http://54.238.94.82/)<br><br>
自分の定期購入物リストを作ることができます。<br>
例えば、トイレットペーパー、洗剤、シャンプーなど。<br>
商品の消費ペースを登録することで、残りわずかになれば知らせてくれます。<br>
是非ストレスのない買い物ライフを！！

# テストアカウント

こちらのアカウントをご使用ください。
- メールアドレス<br>
test@test.com<br><br>
- パスワード<br>
test0000

# 作成期間

- 2020/04/06 プログラミング学習開始
- 2020/05/06 StockWatch開発開始
- 2020/05/18 各機能実装完了
- 2020/06/27 デプロイ完了
- その後、随時バージョンアップ

# 仕様

- macOS Catalina 10.15.5
- MySQL
- Ruby 2.5.1
- Rails 5.2.4.2
- jQuery-rails 4.4.0
- AWS

# DB設計

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

# 主な機能

## ユーザー

- 登録、ログイン、ログアウト
- アカウント情報編集

## 商品

- 登録、編集、削除
- 商品名、外部リンク、画像、消費日数が登録可能

## 在庫

- 在庫状況を％で登録、％と日数で表示
- 1日経過で1日分の在庫が減少
- 残り7日分より少なくなると、買い物リストへ表示

## 購入

- 購入数を登録することで、在庫が購入数×100%増加
- 購入履歴を閲覧可能

# 変更履歴

## ver.1

- 主要機能を実装し、デプロイが完了