class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer "user_id", null: false
	    t.string "first_name", null: false
	    t.string "last_name", null: false
	    t.string "first_name_kana", null: false
	    t.string "last_name_kana", null: false
	    t.integer "postal_code", null: false
	    t.string "address", null: false
	    t.integer "phone", null: false
	    t.integer "postage", default: 500, null: false
	    t.integer "delivery_status", default: 1, null: false
	    t.integer "payment", null: false
    	t.timestamps
    end
  end
end
