class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :plan_name
      t.integer :user_id
      t.string :stripe_card_token
      t.timestamps null: false
    end
  end
end

