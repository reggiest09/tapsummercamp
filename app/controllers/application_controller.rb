class ApplicationController < ActionController::Base
	 layout 'application'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token




  def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		if user.image
			user.image
		else 
			"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=50"
		end
	end
end