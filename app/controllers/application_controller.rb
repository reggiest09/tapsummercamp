class ApplicationController < ActionController::Base
	 layout 'application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_filter :store_current_location, :unless => :devise_controller?


 private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end

private
  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end







  def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else 
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=50"
		end
	end
end