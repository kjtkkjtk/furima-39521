# README

# データベース設計

## users テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| id                  | integer | primary key, auto increment    |
| nickname            | string  | null: false                    |
| email               | string  | null: false, unique: true      |
| encrypted_password  | string  | null: false                    |
| last_name           | string  | null: false                    |
| first_name          | string  | null: false                    |
| last_name_kana      | string  | null: false                    |
| first_name_kana     | string  | null: false                    |
| birthday            | date    | null: false                    |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | -------    | ------------------------------ |
| id                 | integer    | primary key, auto increment    |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_condition_id  | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | -------    | ------------------------------ |
| id             | integer    | primary key, auto increment    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informations テーブル

| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| id            | integer    | primary key, auto increment    |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false, foreign_key: true |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

- belongs_to :order
