class RemoveArticleIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :article_id, :integer
  end
end
