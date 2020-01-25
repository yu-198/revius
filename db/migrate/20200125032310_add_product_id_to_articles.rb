class AddProductIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :product_id, :integer
  end
end
