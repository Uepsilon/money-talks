class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :recipient_id, null: false, index: true
      t.string :sender_name
      t.integer :sender_id
      t.string :iban
      t.string :message
      t.datetime :recieved_at
      t.decimal :amount, precision: 10, scale: 2
      t.string :transaction_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
