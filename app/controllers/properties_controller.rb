class PropertiesController < ApplicationController
	before_action :authenticate_user!

	respond_to :html

	def index
		@properties = Property.all

		respond_with(@properties)
	end

	def show
	end

	def new
		@property = Property.new

		respond_with(@property)
	end

	def create
		@property = Property.new()

		if @property.save
			redirect_to dashboards_path, notice: 'Property added successfully.'
		else
			flash[:alert] = @property.errors.full_messages.join(', ')
			respond_with(@property)
		end
	end
end
