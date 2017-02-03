class AddParentDetailsToUsers < ActiveRecord::Migration
   def change
    add_column :users, :parent_name, :string
    add_column :users, :parent_email, :string
    add_column :users, :child_name, :string
  end
end
