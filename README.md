# テーブル設計

## users テーブル
                                   
| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| email     | string | null: false | #メールアドレス
| password  | string | null: false | #パスワード
| nickname  | string | null: false | #ニックネーム
| las_name  | string | null: false | #苗字・漢字
| fir_name  | string | null: false | #名前・漢字
| las_name_r| string | null: false | #苗字・読仮名
| fir_name_r| string | null: false | #名前・読仮名
| birthday  | date   | null: false | #誕生日

## association
has_many :items
has_many :orders
has_many :comments

## items テーブル
                                                                 
| Column     | Type             | Options                        |
| ---------- | ---------------- | ------------------------------ |
| name       | string           | null:false                     | #商品名
| description| text             | null:false                     | #商品説明
| user_id    | integer          | null:false, foreign_key:true   | #ユーザーID 
| category_id| interger         | null: false                    | #カテゴリー
| status_id  | integer          | null: false                    | #商品の状態
| burden_id  | integer          | null: false                    | #配送者の負担
| area_id    | integer          | null: false                    | #発送元地域
| date_id    | integer          | null: false                    | #発送日の目安
| price      | integer          | null: false                    | #商品価格

## association
belong_to :user
has_one :order
has_many:comments

## orders テーブル
                                                            
| Column         | Type       | Options                      |
| ---------      | ---------- | -----------------------------|
| postalcode     | string     | null: false                  | #郵便番号
| prefecture_id  | integer    | null: false                  | #都道府県
| municipality   | string     | null: false                  | #市区町村
| address        | string     | null: false                  | #番地
| building       | string     |                              | #建物名
| phone          | string     | null: false                  | #電話番号

## association
belong_to:purchases


## comments テーブル

| Column      | Type       | Options                        |
| ---------   | ---------- | ------------------------------ |
| user_id     | integer    |null:false, foreign_key:true    | #ユーザーID 
| item_id     | integer    |null:false, foreign_key:true    | #アイテムID 
| text        | text       |null: false                     | #商品ページのコメント

## association
belong_to :user
belong_to :item

## purchases テーブル

| Column      | Type       | Options                        |
| ---------   | ---------- | ------------------------------ |
| user_id     | integer    |null:false, foreign_key:true    | #ユーザーID 
| item_id     | integer    |null:false, foreign_key:true    | #アイテムID 

## association
belong_to :user
belong_to :item
has_one : order
