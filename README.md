#テーブル設計

## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| profile   | text   | null: false |
| occupation| text   | null: false |
| position  | text   | null: false |

### Association

- belongs_to :prototype
- belongs_to :comments

## prototypesテーブル

| Column    |  Type      | Options     |
| --------- | ---------- | ----------- |
| title     |  string    | null: false |
| catch_copy|  text      | null: false |
| concept   |  text      | null: false |
| image     |            |             |
| user      | references | null: false |

### Association

- has_many :users
- belongs_to :comments

## commentsテーブル

| Column    |  Type      | Options     |
| --------- |  --------- | ----------- |
| text      |  text      | null: false |
| user      | references |             |
| prototype | references |             |

### Association

- has_many :users
- has_many :prototype

