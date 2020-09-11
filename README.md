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
| year          | integer | null: false |
| month         | integer | null: false |
| day           | integer | null: false |


### users-Association

- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_day  | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### items-Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | -------    | ------------------------------ |
| card_number   | integer    | null: false                    |
| limit_mouth   | integer    | null: false                    |
| limit_year    | integer    | null: false                    |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel           | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### purchases-Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### comments-Association

- belongs_to :user
- belongs_to :item