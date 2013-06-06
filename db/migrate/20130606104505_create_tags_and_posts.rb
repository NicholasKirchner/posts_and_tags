class CreateTagsAndPosts < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :posts do |t|
      t.string :title
      t.string :content
      t.timestamps
    end

    create_table :posts_tags do |t|
      t.references :tag
      t.references :post
    end
  end
end
