class AddStripeCustomerIdColumnToSubscription < ActiveRecord::Migration
 def change
    add_column :subscriptions, :stripe_customer_id, :integer
  end
end