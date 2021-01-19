# テーブル設計

## users テーブル

| column          | Type       | options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kana | string     | null: false |
| birth_year      | date       | null: false |
| birth_month     | date       | null: false |
| birth_day       | date       | null: false |

### Association
- has_many :items dependent: :destroy
- has_one :credit_cards dependent: :destroy
- has_one :destinations dependent: :destroy

## items テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| item_name       | string     | null: false                    |
| description     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| item_condition  | string     | null: false                    |
| price           | integer    | null: false                    |
| tax             | integer    | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| user_id         | integer    | null: false , foreign_key: true|
| brand_id        | integer    | null: false , foreign_key: true|
| category_id     | integer    | null: false , foreign_key: true|

### Association

- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy

## destinations テーブル

| column          | Type       | options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| lot_number      | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user_id         | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user

## credit_cards テーブル

| column           | Type       | options                        |
| ---------------- | ---------- | ------------------------------ |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user

## brands テーブル

| column           | Type       | options             |
| ---------------- | ---------- | ------------------- |
| brand_name       | string     |                     |

### Association

- has_many :items

## categories テーブル

| column           | Type       | options             |
| ---------------- | ---------- | ------------------- |
| category_name    | string     | null: false         |

### Association

- has_many :items