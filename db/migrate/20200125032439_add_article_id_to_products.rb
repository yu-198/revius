class AddArticleIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :article_id, :integer
  end
end
