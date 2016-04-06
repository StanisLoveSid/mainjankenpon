class CreateAddLinksToPost < ActiveRecord::Migration
 def change
    add_column :posts, :link, :string
    add_column :posts, :uid, :string
    add_index :posts, :uid, unique: true
  end
end
