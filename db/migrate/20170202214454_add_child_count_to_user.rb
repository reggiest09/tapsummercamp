class AddChildCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :child_count, :integer
  end
end