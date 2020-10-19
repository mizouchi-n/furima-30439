# テーブル設計

## users テーブル
                                   |#comment:user →多：１
| Column    | Type   | Options     |#items：user →多：１
| --------  | ------ | ----------- |#orders:user →多：１
| email     | string | null: false | #メールアドレス
| password  | string | null: false | #パスワード
| nickname  | string | null: false | #ニックネーム
| fam_name  | string | null: false | #苗字・漢字
| fir_name  | string | null: false | #名前・漢字
| fam_name_r| string | null: false | #苗字・読仮名
| fir_name_r| string | null: false | #名前・読仮名
| birthday  | string | null: false | #誕生日

## association
has_many :items
has_many :orders
has_many :comments

## items テーブル
                                                                 |#comment:items →多:1
| Column     | Type             | Options                        |#user：items →１：多
| ---------- | ---------------- | ------------------------------ |#orders：items → 1:1
| user_id    | integer          |foreign_key:true                | #ユーザーID 
| category   | string           | null: false                    | #カテゴリー
| status_id  | integer          | null: false                    | #商品の状態
| burden_id  | integer          | null: false                    | #配送者の負担
| area_id    | integer          | null: false                    | #発送元地域
| Date_id    | integer          | null: false                    | #発送日の目安
| price      | string           | null: false                    | #商品価格

## association
belong_to :users
has_one :orders
has_many:comments

## orders テーブル
                                                            
| Column         | Type       | Options                      |#orders:users →多：１
| ---------      | ---------- | -----------------------------|#orders:items →1:1
| user_id        | integer    |foreign_key:true              | #ユーザーID 
| postalcode     | string     | null: false                  | #郵便番号
| prefectures_id | integer    | null: false                  | #都道府県
| municipality   | string     | null: false                  | #市区町村
| address        | string     | null: false                  | #番地
| building       | string     |                              | #建物名
| phone          | string     | null: false                  | #電話番号

## association
belong_to :users
belong_to:items


## comments テーブル

| Column      | Type       | Options                        |#users:comments →１：多
| ---------   | ---------- | ------------------------------ |#items:comments→１：多
| user_id     | integer    |foreign_key:true                | #ユーザーID 
| item_id     | integer    |foreign_key:true                | #アイテムID 
|   text      | text       | null: false                    | #商品ページのコメント

## association
belong_to :users
belong_to :items

## user-item テーブル

| Column      | Type       | Options                        |
| ---------   | ---------- | ------------------------------ |
| user_id     | integer    |foreign_key:true                | #ユーザーID 
| item_id     | integer    |foreign_key:true                | #アイテムID 