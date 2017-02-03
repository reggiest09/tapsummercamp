class AddColumntosPaymentToSubscriptions < ActiveRecord::Migration
 def change
    add_column :subscriptions, :tos_payment, :boolean, default: false
  end
end