class AddMergToUsers < ActiveRecord::Migration
  def change

    add_column :users, :points, :integer
    add_column :users, :purchase, :integer
    add_column :users, :herotype, :integer
     
  end
end
