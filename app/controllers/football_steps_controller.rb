class FootballStepsController < ApplicationController
   layout 'application'
  before_action :authenticate_user!
  def index
    @user = current_user
    @user.update_attributes(:child_count => params[:interval])
    @subscription = Subscription.new
  end

  def update
    @user = current_user
    if params[:user][:plan_name].present? && params[:user][:interval].present?
      @user.attributes = person_params.merge(plan: params[:user][:interval], plan_name: params[:user][:plan_name],)
    else
      @user.attributes = person_params.merge(child_name: params[:user][:child_name].present? ? params[:user][:child_name] : nil)
    end
    @user.attributes = person_params.merge(child_name: params[:user][:child_name].present? ? params[:user][:child_name] : nil)
    if @user.save
      redirect_to football_payment_path
    else
      render 'index'
    end
    @subscription = Subscription.new
  end

  def football_payment
    @subscription = Subscription.new
  end
  private
  def person_params
    params.require(:user).permit(:plan, :plan_name,:first_name, :last_name,
                                 :school_name,:home_address,:home_city,:home_state,
                                 :home_zip_code,:phone,
                                 :primary_phone,:dob,
                                 :grand_level,:event,
                                 :shirt_size,:father_name,
                                 :company,:parent_name,:parent_email,:child_name,
                                 :other_arrangements,:player_weight,
                                 :amount,:register_for => [])
  end

end
