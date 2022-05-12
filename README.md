## users

|Column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|last_name         |string |null: false              |
|first_name        |string |null: false              |
|last_name_kana    |string |null: false              |
|first_name_kana   |string |null: false              |
|birth_date        |date   |null: false              |

### Association
- has_many :items
- has_many :buyer



## items

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|name              |string    |null: false                   |
|content           |text      |null: false                   |
|category_id       |integer   |null: false                   |
|status_id         |integer   |null: false                   |
|delivery_charge_id|integer   |null: false                   |
|source_id         |integer   |null: false                   |
|shopping_days_id  |integer   |null: false                   |
|price             |integer   |null: false                   |
|user_id           |references|null: false, foreign_key: true|

### Association
- belongs_to :category
- belongs_to :status
- belongs_to :delivery_charge
- belongs_to :source
- belongs_to :shopping_days

- belongs_to :users
- has_one :orders

## category
- 手動でファイルを作成する。
- 商品のカテゴリーを選択できる様にする。
### Association
has_many :items


## status
- 手動でファイルを作成する。
- 商品の状態を選択できる様にする。
### Association
has_many :items


## delivery_charge
- 手動でファイルを作成する。
- 送料の負担を出品者か購入者のどちらかから選択できる様にする。
### Association
has_many :items


## source
- 手動でファイルを作成する。
- 発送元の地域を47都道府県+"--"から選択できる様にする。
### Association
has_many :items


## shopping_days
- 手動でファイルを作成する。
- 発送までの日数を
### Association
has_many :items



## orders

|Column        |Type   |Options    |
|--------------|-------|-----------|
|post_code     |string |null: false|
|city          |string |null: false|
|address       |string |null: false|
|building      |string |           |
|tel           |string |null: false|
|prefectures_id|integer|null: false|

### Association
- belongs_to :prefectures

- belongs_to :items
- has_one :buyer


## prefectures
- 手動でファイルを作成する。
- 47都道府県+"--"から選択できる様にする。
### Association
has_many :orders


## buyer

|Column            |Type      |Options                       |
|------------------|----------|------------------------------|
|user_id           |references|null: false, foreign_key: true|
|orders_id|        |references|null: false, foreign_key: true|

### Association
- belongs_to :users
- belongs_to :orders