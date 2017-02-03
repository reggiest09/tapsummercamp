class Subscription < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :stripe_customer

  def save_with_payment(user)
    if valid?
      create_stripe_customer_and_subscription(user)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  # def create_stripe_customer_and_subscription(user)
  #   begin
  #     s_customer = Stripe::Customer.create(description: user.first_name, card: self.stripe_card_token,email: user.email)
  #     stripe_customer = StripeCustomer.create(object: s_customer.object, description: s_customer.description, livemode: s_customer.livemode, created_timestamp: s_customer.created, reference_id: s_customer.id, user_id: self.user_id)
  #     customer = Stripe::Customer.retrieve(stripe_customer.reference_id)
  #     user.plan_name = "school_closing"
  #     user.plan = "daily"
  #     if user.plan_name == "school_closing" && user.plan == "daily"
  #       stripe_charge = Stripe::Charge.create(amount: stripe_charge_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
  #       user.stripe_charges.create(amount: stripe_charge_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
  #     elsif user.plan_name == "queen_city" && user.plan == "weekly"
  #       stripe_charge = Stripe::Charge.create(amount: after_school_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
  #       user.stripe_charges.create(amount: after_school_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
  #     elsif user.plan_name == "school_closing" && user.plan == "all_days"
  #       stripe_charge = Stripe::Charge.create(amount: stripe_all_dates, currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
  #       user.stripe_charges.create(amount: stripe_all_dates, currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
  #     elsif user.plan_name == "football" || user.plan_name == "basketball"
  #       stripe_charge = Stripe::Charge.create(amount: stripe_football_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
  #       user.stripe_charges.create(amount: stripe_football_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
  #     elsif user.plan_name == "summer_wk"
  #       #stripe_charge = Stripe::Charge.create(amount: stripe_football_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for test@example.com")
  #       user.stripe_charges.create(amount: stripe_football_amount(user), currency: "usd", description: "test", stripe_customer_id: s_customer.id) 
  #       subscription = customer.subscriptions.create(:plan => user.plan)
  #       user.subscriptions.create(stripe_card_token: subscription.id,plan_name: user.plan_name, stripe_customer_id: customer.id)
  #     elsif user.children_names.present?
  #       stripe_charge = Stripe::Charge.create(amount: after_school_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for After-School Registration")
  #       user.stripe_charges.create(amount: after_school_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
  #     else
  #       subscription = customer.subscriptions.create(:plan => payment_discount)
  #       user.subscriptions.create(stripe_card_token: subscription.id,plan_name: user.plan_name, stripe_customer_id: stripe_customer.id)
  #     end
  #   rescue Exception => e
  #   end
  # end


  def create_stripe_customer_and_subscription(user)
    begin
      s_customer = Stripe::Customer.create(description: user.first_name, card: self.stripe_card_token, email: user.email)
      stripe_customer = StripeCustomer.create(object: s_customer.object, description: s_customer.description, livemode: s_customer.livemode, created_timestamp: s_customer.created, reference_id: s_customer.id, user_id: self.user_id)
      customer = Stripe::Customer.retrieve(stripe_customer.reference_id)
      
      if user.plan_name == "school_closing_date" && user.plan == "daily"
        stripe_charge = Stripe::Charge.create(amount: stripe_charge_amount(user), currency: "usd", customer: s_customer.id, description: "school_closing daily")
        user.stripe_charges.create(amount: stripe_charge_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
      elsif user.plan_name == "school_closing_date" && user.plan == "all_days"
        stripe_charge = Stripe::Charge.create(amount: stripe_all_dates, currency: "usd", customer: s_customer.id, description: "school_closing all days")
        user.stripe_charges.create(amount: stripe_all_dates, currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
      elsif user.plan_name == "christmas_break" && user.plan == "daily"
        stripe_charge = Stripe::Charge.create(amount: stripe_charge_amount(user), currency: "usd", customer: s_customer.id, description: "xmas daily")
        user.stripe_charges.create(amount: stripe_charge_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
      elsif user.plan_name == "christmas_break" && user.plan == "all_days"
        stripe_charge = Stripe::Charge.create(amount: stripe_all_dates, currency: "usd", customer: s_customer.id, description: "Xmas all days")
        user.stripe_charges.create(amount: stripe_all_dates, currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)  
      elsif user.plan_name == "spring_break" && user.plan == "daily"
        stripe_charge = Stripe::Charge.create(amount: stripe_charge_amount(user), currency: "usd", customer: s_customer.id, description: "spring break daily")
        user.stripe_charges.create(amount: stripe_charge_amount(user), currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)
      elsif user.plan_name == "spring_break" && user.plan == "all_days"
        stripe_charge = Stripe::Charge.create(amount: stripe_all_dates, currency: "usd", customer: s_customer.id, description: "spring break all days")
        user.stripe_charges.create(amount: stripe_all_dates, currency: "usd", description: "test", stripe_customer_id: stripe_customer.id)  
      elsif user.plan_name == "charlotte" || user.plan_name == "noresmen_cheer"
        
        stripe_charge = Stripe::Charge.create(amount: stripe_football_amount(user), currency: "usd", customer: s_customer.id, description: "Charge For Charlotte")
        user.stripe_charges.create(amount: stripe_football_amount(user), currency: "usd", description: "Charlotte", stripe_customer_id: stripe_customer.id)
      
      elsif user.plan_name == "eden" || user.plan_name == "noresmen_cheer"
        
        stripe_charge = Stripe::Charge.create(amount: stripe_football_amount(user), currency: "usd", customer: s_customer.id, description: "Charge for Eden")
        user.stripe_charges.create(amount: stripe_football_amount(user), currency: "usd", description: "Eden", stripe_customer_id: stripe_customer.id)

      elsif user.plan_name == "early_bird" || user.plan_name == "norsemen_baseball"
        stripe_charge = Stripe::Charge.create(amount: stripe_early_bird_amount(user), currency: "usd", customer: s_customer.id, description: "EarlyBird")
        user.stripe_charges.create(amount: stripe_early_bird_amount(user), currency: "usd", description: "EarlyBird", stripe_customer_id: stripe_customer.id)  
      else
        
        
        subscription = customer.subscriptions.create(:plan => payment_discount(user.plan_name))
        user.subscriptions.create(stripe_card_token: subscription.id,plan_name: user.plan_name, stripe_customer_id: stripe_customer.id)
      end
    rescue Exception => e
    end
  end

  def payment_discount(plan_name)
    
    if plan_name == "AFW1Child"
      plan = "afw1"
    elsif plan_name == "AFW2Child"
      plan = "afw2"
    elsif plan_name == "AFW3Child"
      plan = "afw3"
    elsif plan_name == "AFM1Child"
      plan = "afm1"
    elsif plan_name == "AFM2Child"
      plan = "afm2"
    elsif plan_name == "AFM3Child"
      plan = "afm3"
    elsif plan_name == "BAW1Child"
      plan = "baw1"
    elsif plan_name == "BAW2Child"
      plan = "baw2"
    elsif plan_name == "BAM1Child"
      plan = "baw1"
    elsif plan_name == "BAW3Child"
      plan = "baw3"
    elsif plan_name == "BAW3Child"
      plan = "baw3"
    elsif plan_name == "BAM1Child"
      plan = "bam1"
    elsif plan_name == "BAM2Child"
      plan = "bam2"
    elsif plan_name == "BAM3Child"
      plan = "bam3"
    elsif plan_name == "BW1Child"
      plan = "bw"
    elsif plan_name == "BW1Child"
      plan = "bw"
    elsif plan_name == "BW2Child"
      plan = "bw2"
    elsif plan_name == "BW3Child"
      plan = "bw3"
    elsif plan_name == "BM1Child"
      plan = "bm"
    elsif plan_name == "BM2Child"
      plan = "bm2"
    elsif plan_name == "BM3Child"
      plan = "bm3"
    else
      plan = ""
    end
    return plan
  end

  def stripe_charge_amount(user)
    days_amount = (user.holiday.reject { |c| c.empty? }.count) * 25
    (user.child_count.to_i * days_amount) * 100
  end

  def after_school_amount(user)
    (25 * user.children_names.count) * 100
  end

  def stripe_all_dates
    (85 * user.children_names.count)  * 100
  end

  def stripe_football_amount(user)
    (35 * user.child_count.to_i) * 100
  end
  def stripe_early_bird_amount(user)
    (985 * user.child_count.to_i) * 100
  end

  def stripe_baseball_and_basketball_amount(user)
    (100 * user.child_count.to_i) * 100
  end

  # def check_subscription(user)
  #   if user.plan_name == "taps"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("taps") ? true : false
  #   elsif user.plan_name == "queen_city"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("queen_city") ? true : false
  #   elsif user.plan_name == "before_school"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("before_school") ? true : false
  #   elsif user.plan_name == "after_school"
  #     user.subscriptions.present? && user.subscriptions.pluck(:plan_name).include?("after_school") ? true : false
  #   end
  # end
end
