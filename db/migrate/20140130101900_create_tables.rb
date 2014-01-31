class CreateTables < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string    :name
      t.timestamps  
    end

    create_table :posts do |t|
      t.string    :title
      t.text      :body
      t.string    :author
      t.timestamps
    end

    create_table :tag_links do |t|
      t.integer     :tag_id
      t.integer     :post_id
      t.timestamps
      t.belongs_to  :post
      t.belongs_to  :tag
    end

    add_index :tag_links, :tag_id
    add_index :tag_links, :post_id
  end
end
