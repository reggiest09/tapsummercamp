class SubscriptionsController < ApplicationController
  layout 'application'
  # include Wicked::Wizard
  # steps :student_info, :gardian_details, :other_deatils, :redme, :payment

  def create
    @subscription = Subscription.new(sub_params)
    if @subscription.save_with_payment(current_user)
      redirect_to :back, :notice => "Thank you for your purchase!"
    else
      redirect_to :back, :notice => "Card details is invalid please check!"
    end
  end

def check_coupon_code
    user = User.find(params[:id])
    all_codes = Coupon.pluck(:coupon_code)
    find_coupon = Coupon.find_by_coupon_code(params[:code])
    if (find_coupon.present? && find_coupon.active == false) && all_codes.include?(params[:code])
      coupon = find_coupon.update_attributes(user_id: user.id,active: true)
      msg = "coupon sucessfully applied need to pay $200" if user.plan == "monthly" && (user.plan_name == "taps" || user.plan_name == "queen_city")
      msg = "coupon sucessfully applied need to pay $50" if user.plan == "weekly" && (user.plan_name == "taps" || user.plan_name == "queen_city")
      msg = "coupon sucessfully applied need to pay $20" if user.plan == "weekly" && (user.plan_name == "before_school")
      msg = "coupon sucessfully applied need to pay $80" if user.plan == "monthly" && (user.plan_name == "before_school")
      msg = "coupon sucessfully applied need to pay $70" if user.plan == "weekly" && (user.plan_name == "after_school")
      msg = "coupon sucessfully applied need to pay $280" if user.plan == "monthly" && (user.plan_name == "after_school")
      flag = "true"
    elsif (find_coupon.present? && find_coupon.active == true) && all_codes.include?(params[:code])
      find_coupon.delete
      msg = "coupon expired subscribe account"
      flag = "false"
    else
      msg = "coupon invalid need to subscribe"
      flag = "false"
    end
    render json: {msg: msg,flag: flag}
  end

  def cancel
    @subscription = current_user.subscriptions.where(stripe_card_token: params[:subscription_id]).first
    @subscription.update_attributes(active: false)
    if @subscription.stripe_customer.present?
      customer = Stripe::Customer.retrieve(@subscription.stripe_customer.reference_id)
      customer.subscriptions.retrieve(@subscription.stripe_card_token).delete
    end
    redirect_to :back, notice: "You have successfully unsubscribe your subscription"
  end

  private

  def sub_params
    params.require(:subscription).permit(:stripe_card_token, :user_id, :active, :tos_payment, :plan_name)
  end

end
