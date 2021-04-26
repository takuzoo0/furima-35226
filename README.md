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

# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| kana_name | string  | null:false  |
| birth_day | integer | null: false |

### Association

- has_many :product
- has_one :purchase

## products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| shipping_charge | string     | null: false                    |
| shipping_area   | string     | null: false                    |
| ship_to_days    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column        | Type       | Options                        |
| :------------ | ---------- | ------------------------------ |
| card          | integer    | null: false                    |
| deadline      | integer    | null: false                    |
| security      | integer    | null: false                    |
| postal_cord   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product