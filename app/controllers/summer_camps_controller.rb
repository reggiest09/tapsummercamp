class SummerCampsController < ApplicationController
	 layout 'application'
  before_action :authenticate_user!
  def index
    @user = current_user
    @user.update_attributes(:child_count => params[:interval])
    @user.build_children(params[:interval].to_i)
    
    @subscription = Subscription.new
  end

  def update
    @user = current_user
    if @user.update_attributes(person_params)
      redirect_to summer_payment_path
    else
      render 'index'
    end
    @subscription = Subscription.new
  end

  def summer_payment
    @subscription = Subscription.new
  end
  private
  def person_params
    params.merge(plan: params[:user][:interval]) if params[:user][:interval]
    params.require(:user).permit(:plan, :plan_name,:first_name, :last_name,
                                 :school_name,:home_address,:home_city,:home_state,
                                 :home_zip_code,:phone,
                                 :primary_phone,:dob,
                                 :grand_level,:event,
                                 :shirt_size,:father_name,
                                 :company,:parent_name,:parent_email,:child_name,:plan_name,
                                 :other_arrangements,:player_weight,
                                 :amount,:register_for => [],:children_attributes => [:id,:dob,:name,:grade,:home_address,:shirt_size,:short_size,:allergies,:_destroy,:soccer_postiion => []])
  end

end

