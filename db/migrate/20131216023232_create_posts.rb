class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :post_type
      t.string :category_name

      t.timestamps
    end
  end
end
