class CreateStripeCustomers < ActiveRecord::Migration
  def change
    create_table :stripe_customers do |t|
      t.string :object
      t.string :description
      t.boolean :livemode
      t.integer :created_timestamp
      t.string :reference_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end