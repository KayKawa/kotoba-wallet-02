# テーブル設計

## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| id                 |        |             |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| gender             | string | null:false  |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_kana          | string | null: false |
| first_kana         | string | null: false |
| birthday           | date   | null: false |

### Association

- has_one:profile
- has_many:messages
- has_many:buys
- has_one:wallet

## Profiles テーブル

| Column | Type       | Options          |
| ------ | ---------- | ---------------- |
| id     |            |                  |
| user   | references | foreign_key:true |
|        | text       |                  |
|        | string     |                  |
|        | string     |                  |
|        | integer    |                  |

### Association

- belongs_to:user

## Wallets テーブル

| Column         | Type       | Options          |
| -------------- | ---------- | ---------------- |
| id             |            |                  |
| user           | references | foreign_key:true |
| stock_quantity | integer    | null: false      |

### Association

- belongs_to:user
- has_one:statement
- has_many:buys
- has_many:purchases

## Statement テーブル

| Column    | Type       | Options          |
| --------- | ---------- | ---------------- |
| id        |            |                  |
| wallet_id | references | foreign_key:true |
| plus      | integer    |                  |
| minus     | integer    |                  |

### Association

- belongs_to:wallet
- has_many:purchases
- has_many:buys

## Purchases テーブル

| Column       | Type       | Options          |
| ------------ | ---------- | ---------------- |
| id           |            |                  |
| statement_id | references | foreign_key:true |
| wallet_id    | references | foreign_key:true |
| quantity     | integer    | null:false       |

### Association

- belongs_to:wallet
- belongs_to:statement

## Buys テーブル

| Column       | Type       | Options          |
| ------------ | ---------- | ---------------- |
| id           |            |                  |
| wallet_id    | references | foreign_key:true |
| statement_id | references | foreign_key:true |
| giver_id     | references |                  |
| taker_id     | references |                  |
| quantity     | integer    |                  |
| unit_price   | integer    |                  |
| total_price  | integer    |                  |

### Association

- has_one:message
- belongs_to:user
- belongs_to:wallet
- belongs_to:statement

## Messages テーブル

| Column   | Type       | Options          |
| -------- | ---------- | ---------------- |
| id       |            |                  |
| buy_id   | references | foreign_key:true |
| giver_id | references |                  |
| taker_id | references |                  |
| message  | text       | null:false       |

### Association

- belongs_to:buy
- belongs_to:user
