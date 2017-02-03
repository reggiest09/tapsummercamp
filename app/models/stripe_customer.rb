class StripeCustomer < ActiveRecord::Base
	belongs_to :user
	has_many :subscriptions
	has_many :stripe_charges
end
