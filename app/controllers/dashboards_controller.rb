class DashboardsController < ApplicationController
	before_action :authenticate_user!

	respond_to :html

	def index
		@property = current_user.current_property

		respond_with(@property)
	end
end
