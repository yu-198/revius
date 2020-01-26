class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string "name", null: false
      t.text "image_id"
      t.text "introduction", :limit => 4294967295, null: false
      t.timestamps
    end
  end
end
