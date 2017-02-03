class AddPlanTypeToStripePlan < ActiveRecord::Migration
   def change
    add_column :stripe_plans, :plan_type, :string
  end
end
