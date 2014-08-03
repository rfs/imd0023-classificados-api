class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.decimal :value, precision: 8, scale: 2
      t.boolean :selling
      t.string :photo
    end
    add_index :items, :user_id
  end
end
