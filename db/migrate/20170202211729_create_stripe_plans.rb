class CreateStripePlans < ActiveRecord::Migration
  def change
    create_table :stripe_plans do |t|
      t.integer :user_id
      t.string :plan_name
      t.string :price
      t.string :reference_id
      t.timestamps null: false
    end
  end
end