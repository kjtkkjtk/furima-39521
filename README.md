# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
| created_at     | datetime| null: false                    |
| updated_at     | datetime| null: false                    |

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
| created_at  | datetime| null: false                    |
| updated_at  | datetime| null: false                    |

### Association

- belongs_to :user

