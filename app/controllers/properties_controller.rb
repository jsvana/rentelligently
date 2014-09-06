class PropertiesController < ApplicationController
	before_action :authenticate_user!

	respond_to :html

	def index
		@properties = Property.all

		respond_with(@properties)
	end

	def show
		@property = Property.find(params[:id])

		respond_with(@property)
	end

	def new
		@property = Property.new

		respond_with(@property)
	end

	def create
		@property = Property.new(params[:property])

		if @property.save
			redirect_to dashboards_path, notice: 'Property added successfully.'
		else
			flash[:alert] = @property.errors.full_messages.join(', ')
			respond_with(@property)
		end
	end
end
