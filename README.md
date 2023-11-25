# README

# データベース設計

## users テーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| id                  | integer | primary key, auto increment    |
| username            | string  | null: false                    |
| email               | string  | null: false, unique            |
| encrypted_password  | string  | null: false                    |

### Association

- has_many :items
- has_many :purchases
- has_one :information

## items テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| id             | integer | primary key, auto increment    |
| name           | string  | null: false                    |
| description    | text    |                               |
| price          | integer | null: false                    |
| user_id        | integer | foreign key                    |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| id             | integer | primary key, auto increment    |
| item_id        | integer | foreign key                    |
| buyer_id       | integer | foreign key                    |
| price          | integer | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information

## informations テーブル

| Column      | Type   | Options                        |
| ----------- | ------ | ------------------------------ |
| id          | integer| primary key, auto increment    |
| user_id     | integer| foreign key                    |
| postal_code | string | null: false                    |
| address     | string | null: false                    |


### Association

- belongs_to :user

