class AddHolidayFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :holiday, :string
  end
end