class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, uniqueness: true
      t.string :email
      t.string :hash_word

      t.timestamps null: false
    end
  end
end
