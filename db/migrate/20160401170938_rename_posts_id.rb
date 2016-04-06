class RenamePostsId < ActiveRecord::Migration
 def change
    add_column :lessons, :lesson_id, :integer
  end
end
