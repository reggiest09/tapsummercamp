class StripeCharge < ActiveRecord::Base
	belongs_to :stripe_customer
	belongs_to :user
end
