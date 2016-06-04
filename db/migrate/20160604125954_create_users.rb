class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :salt

      t.string :pb_id
      t.string :pb_pw
      t.string :token
      t.datetime :token_exp

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
