class DashboardsController < ApplicationController
	before_action :authenticate_user!

	respond_to :html

	def index
		if current_user.has_current_property?
			redirect_to current_user.current_property
		else
			redirect_to new_property_path
		end
	end
end
