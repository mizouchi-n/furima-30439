class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :img
      t.string :name, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :burden_id, null: false
      t.integer :area_id, null: false
      t.integer :day_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
