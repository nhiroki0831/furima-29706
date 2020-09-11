# README

# テーブル設計(furima-29706)

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| family_name   | string  | null: false |
| first_name    | string  | null: false |
| family_name_k | string  | null: false |
| first_name_k  | string  | null: false |
| birthday      | date    | null: false |


### users-Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| delivery_area | integer    | null: false                    |
| shipping_day  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### items-Association

- belongs_to :user
- has_many :comments
- has_one :order

## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### shippings-Association

- belongs_to :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### comments-Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

- has_one :shipping
- belongs_to :user
- belongs_to :item