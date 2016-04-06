class CreateJoinTableForUsersPosts < ActiveRecord::Migration
   def change
    create_table :postss_users, id: false do |t|
      t.belongs_to :post
      t.belongs_to :user
      end
    end
end
