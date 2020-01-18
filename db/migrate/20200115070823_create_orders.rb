class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer "user_id", null: false
      t.integer "product_id", null: false
    	t.integer "quantity", null: false
    	t.integer "price", null: false
	    t.integer "postage", default: 500, null: false
	    t.integer "delivery_status", default: 1, null: false
	    t.integer "payment", default: 1
    	t.timestamps
    end
  end
end
