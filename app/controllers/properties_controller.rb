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
		@property = Property.new(property_params)
		@property.user_id = current_user.id

		if @property.save
			rental_term = RentalTerm.new(rental_term_params)
			rental_term.user_id = current_user.id
			rental_term.property_id = @property.id
			rental_term.save
			redirect_to root_path, notice: 'Property added successfully.'
		else
			flash[:alert] = @property.errors.full_messages.join(', ')
			respond_with(@property)
		end
	end

private

	def property_params
		params.require(:property).permit(:name, :address, :description,
																		 :landlord_name, :landlord_phone,
																		 :landlord_email, :image, :rent)
	end

	def rental_term_params
		params.require(:rental_term).permit(:end_date, :start_date, :comments,
																			  :property_rating, :landlord_rating)
	end
end
