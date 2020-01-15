class CreateShipToAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_to_addresses do |t|
      t.integer "user_id", null: false
      t.string "first_name", null: false
      t.string "last_name", null: false
      t.string "first_name_kana", null: false
      t.string "last_name_kana", null: false
      t.integer "postal_code", null: false
      t.string "address", null: false
      t.integer "phone", null: false
      t.string "email", null: false
      t.timestamps
    end
  end
end
