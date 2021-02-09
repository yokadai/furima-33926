# テーブル設計

## users テーブル

| column             | Type       | options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birthday           | date       | null: false               |


### Association
- has_many :user_items
- has_many :items dependent: :destroy

## items テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| prefecture_id   | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| price           | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| user            | references | null: false , foreign_key: true|
| category_id     | integer    | null: false                    |

### Association

- belongs_to :user 
- has_one :user_item

## destinations テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| lot_number      | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| user_item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user_item

## user_items テーブル
| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item