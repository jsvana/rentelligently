class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def layout_by_resource
		if devise_controller? and user_signed_in?
			'login'
		else
			'application'
		end
	end
end
