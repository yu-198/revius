class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
    	t.integer "order_id", null: false
    	t.integer "product_id", null: false
    	t.integer "quantity", null: false
    	t.integer "price", null: false
    	t.timestamps
    end
  end
end
