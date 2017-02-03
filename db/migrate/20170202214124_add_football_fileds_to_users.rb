class AddFootballFiledsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :primary_phone, :string
    add_column :users, :dob, :string
    add_column :users, :grand_level, :string
    add_column :users, :event, :string
    add_column :users, :shirt_size, :string
    add_column :users, :company, :string
    add_column :users, :register_for, :string
    add_column :users, :player_weight, :string
    add_column :users, :amount, :string
  end
end