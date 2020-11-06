## usersテーブル

|Column      |Type     | Options                 |
|------------|---------|-------------------------|
| nickname   | string  | null:false              |
| password   | string  | null:false              |
| email      | string  | null:false,unique: true |
| first_name | string  | null:false              |
| last_name  | string  | null:false              |
| birthday   | integer | null:false              |

### Association
- has_many : purchase_record
- has_many : item
- belongs_to :

## itemsテーブル

|Column               |Type     | Options    |
|---------------------|---------|------------|
| item_name           | string  | null:false |
| item_description    | string  | null:false |
| category            | string  | null:false |
| item_status         | string  | null:false |
| price               | integer | null:false |
| shipping_fee_burden | integer | null:false |
| shipping_area       | string  | null:false |
| shipping_days       | integer | null:false |

### Association
- has_one : purchase_record
- belongs_to : user

## purchase_recordテーブル

|Column           |Type        | Options    |
|-----------------|------------|------------|
| purchase_date   | integer    | null:false |
| user            | references | null:false |
| item            | references | null:false |

### Association
- belongs:to : user
- belongs_to : item
- has_many : address

## addressテーブル

|Column        |Type     | Options    |
|--------------|---------|------------|
| phone_number | integer | null:false |
| region       | string  | null:false |
| city         | string  | null:false |
| street       | integer | null:false |
| postal_code  | integer | null:false |

### Association
- belongs_to : purchase_record