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
- has_many :purchases

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | -------    | ------------------------------ |
| id                 | integer    | primary key, auto increment    |
| name               | string     | null: false                    |
| description        | text       |                                |
| category           | string     |                                |
| item_condition     | string     |                                |
| shipping_fee       | string     |                                |
| days_to_ship       | string     |                                |
| prefecture         | string     |                                |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| id             | integer | primary key, auto increment    |
| item_id        | integer | foreign key                    |
| buyer_id       | integer | foreign key                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informations テーブル

| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| id            | integer    | primary key, auto increment    |
| user          | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     |                                |
| purchase_id   | integer    | foreign key                    |



