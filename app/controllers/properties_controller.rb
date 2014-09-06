class PropertiesController < ApplicationController
	before_action :authenticate_user!

	respond_to :html

	def index
	end

	def show
	end

	def new
		@property = Property.new

		respond_with(@property)
	end

	def create
	end
end
