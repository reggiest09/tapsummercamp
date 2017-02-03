class CreateStripeCharges < ActiveRecord::Migration
  def change
    create_table :stripe_charges do |t|
      t.float :amount
      t.string :currency, default: "usd"
      t.text :description
      t.integer :stripe_customer_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end