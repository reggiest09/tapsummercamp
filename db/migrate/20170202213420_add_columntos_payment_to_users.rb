class AddColumntosPaymentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tos_payment, :boolean, default: false
  end
end