# テーブル設計

## users テーブル
                                   |#comment:user →多：１
| Column    | Type   | Options     |#items：user →多：１
| --------  | ------ | ----------- |#orders:user →多：１
| email     | string | null: false | #メールアドレス
| password  | string | null: false | #パスワード
| nickname  | string | null: false | #ニックネーム
| fam-name  | string | null: false | #苗字・漢字
| fir-name  | string | null: false | #名前・漢字
| fam-name-r| string | null: false | #苗字・読仮名
| fir-name-r| string | null: false | #名前・読仮名

## items テーブル
                                                                 |#comment:items →多:1
| Column     | Type             | Options                        |#user：items →１：多
| ---------- | ---------------- | ------------------------------ |#orders：items → 1:1
| user_id    | integer          |foreign_key:true                | #ユーザーID 
| seller     | string           | null: false                    | #出品者
| category   | string           | null: false                    | #カテゴリー
| status     | string           | null: false                    | #商品の状態
| burden     | string           | null: false                    | #配送者の負担
| area       | string           | null: false                    | #発送元地域
| Date       | references       | null: false                    | #発送日の目安

## orders テーブル
                                                            
| Column      | Type       | Options                      |#orders:users →多：１
| ---------   | ---------- | -----------------------------|#orders:items →1:1
| user_id     | integer    |foreign_key:true              | #ユーザーID 
| card        | staring    | null: false                  | #カード情報
| deadline    | staring    | null: false                  | #有効期限
| security    | staring    | null: false                  | #セキュリティーコード
| postalcode  | staring    | null: false                  | #郵便番号
| municipality| staring    | null: false                  | #市区町村
| address     | staring    | null: false                  | #番地
| building    | staring    | null: false                  | #建物名
| phone       | staring    | null: false                  | #電話番号


## comments テーブル

| Column      | Type       | Options                        |#users:comments →１：多
| ---------   | ---------- | ------------------------------ |#items:comments→１：多
| user_id     | integer    |foreign_key:true                | #ユーザーID 
| item_id     | integer    |foreign_key:true                | #アイテムID 
|   text      | text       | null: false                    | #商品ページのコメント