class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :phone
      t.string :avatar
    end
    add_index :users, :email, unique: true
  end
end
