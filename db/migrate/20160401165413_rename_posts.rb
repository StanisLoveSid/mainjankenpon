class RenamePosts < ActiveRecord::Migration
  def change
  rename_table :posts, :lessons
end
end
