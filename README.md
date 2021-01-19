# テーブル設計

## users テーブル

| column             | Type       | options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birthday           | date       | null: false |


### Association
- has_many :items dependent: :destroy

## items テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item_name       | string     | null: false                    |
| description     | string     | null: false                    |
| prefecture_id   | integer     | null: false                    |
| item_condition  | string     | null: false                    |
| price           | integer    | null: false                    |
| tax             | integer    | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| user_id         | integer    | null: false , foreign_key: true|
| brand_id        | integer    | null: false , foreign_key: true|
| category_id     | integer    | null: false , foreign_key: true|

### Association

- belongs_to :user 
- belongs_to :brand 

## destinations テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| lot_number      | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |
| user_id         | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user

## brands テーブル

| column           | Type       | options             |
| ---------------- | ---------- | ------------------- |
| brand_name       | string     |                     |

### Association

- has_many :items

## 