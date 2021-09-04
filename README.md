# テーブル設計

## users

| Column | Type | Options |
| ------ | ---- | ------- |
| family_name | string | null: false |
| last_name | string | null: false |
| phone_number | string | null: false |
| email | string | null: false |
| encrypted_password | string | null: false |
| company_name | string | null: false

### Association

- has_many :user_maps
- has_many :maps, through: user_maps
- has_many :messages

## maps

| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null: false |
| address | text | null: false |
| latitude | float | null: false |
| longitude | float | null: false |
| content | text |        |

### Association

- has_many :user_maps
- has_many :users, through: user_maps
- has_many :messages

## user_maps

| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :map

## messages

| Column | Type | Options |
| ------ | ---- | ------- |
| comment | text |  |
| user | references | null: false, foreign_key: true |
| map | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :map