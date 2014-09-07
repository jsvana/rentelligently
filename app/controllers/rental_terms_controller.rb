class RentalTermsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def new
    @property = Property.find(params[:property_id])
    @rental_term = RentalTerm.new

    respond_with(@property, @rental_term)
  end

  def create
    @property = Property.find(params[:property_id])
    @rental_term = RentalTerm.new(rental_term_params)
    @rental_term.user_id = current_user.id
    @rental_term.property_id = @property.id

    if @rental_term.save
      redirect_to @property, notice: 'Rental term added successfully'
    else
      flash[:alert] = @rental_term.errors.full_messages.join(', ')
      respond_with(@rental_term)
    end
  end

  def edit
    @property = Property.find(params[:property_id])
    @rental_term = RentalTerm.find(params[:id])

    respond_with(@property, @rental_term)
  end

  def update
    @property = Property.find(params[:property_id])
    @rental_term = RentalTerm.find(params[:id])

    @rental_term.update_attributes(rental_term_params)

    if @rental_term.save
      redirect_to @property, notice: 'Rental term updated successfully.'
    else
      flash[:alert] = @rental_term.errors.full_messages.join(', ')
      respond_with(@rental_term)
    end
  end

private

  def rental_term_params
    params.require(:rental_term).permit(:start_date, :end_date, :comments,
				        :property_rating, :landlord_rating)
  end
end
