## usersテーブル

|Column           |Type    | Options                 |
|-----------------|--------|-------------------------|
| nickname        | string | null:false              |
| password        | string | null:false              |
| email           | string | null:false,unique: true |
| first_name      | string | null:false              |
| last_name       | string | null:false              |
| first_name_kana | string | null:false              |
| last_name_kana  | string | null:false              |
| birthday        | date   | null:false              |

### Association
- has_many : purchase_records
- has_many : items

## itemsテーブル

|Column                  |Type        | Options    |
|------------------------|------------|------------|
| item_name              | string     | null:false |
| item_description       | text       | null:false |
| category_id            | integer    | null:false |
| item_status_id         | integer    | null:false |
| price                  | integer    | null:false |
| shipping_fee_burden_id | integer    | null:false |
| shipping_area_id       | integer    | null:false |
| shipping_days_id       | integer    | null:false |
| user                   | references | null:false |

### Association
- has_one : purchase_record
- belongs_to : user

## purchase_recordテーブル

|Column           |Type        | Options    |
|-----------------|------------|------------|
| user            | references | null:false |
| item            | references | null:false |

### Association
- belongs:to : user
- belongs_to : item
- has_many : address

## addressテーブル

|Column           |Type        | Options     |
|-----------------|------------|-------------|
| phone_number    | string     | null:false  |
| region          | string     | null:false  |
| city            | string     | null:false  |
| street          | string     | null:false  |
| building        | string     |             |
| postal_code     | string     | null:false  |
| purchase_record | references | null:false  |

### Association
- belongs_to : purchase_record