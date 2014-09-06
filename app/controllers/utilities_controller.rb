class UtilitiesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @property = Property.find(params[:property_id])

    respond_with(@property)
  end

  def show
    @utility = Utility.find(params[:id])

    respond_with(@utility)
  end

  def new
    @utility = Utility.new
    @property = Property.find(params[:property_id])

    respond_with(@utility, @property)
  end

  def create
    @utility = Utility.new(utility_params)
    @property = Property.find(params[:property_id])
    @utility.property_id = @property.id

    if @utility.save
      occupants = @property.current_occupants
      occupants.each do |occupant|
	Due.create(
	  user_id: occupant.id,
	  utility_id: @utility.id,
	  amount: @utility.cost / occupants.count
	)
      end

      redirect_to property_utilities_path(@property), notice: 'Utility added successfully.'
    else
      flash[:alert] = @utility.errors.full_messages.join(', ')
      respond_with(@utility)
    end
  end

  def pay
    due = Due.find_by(user_id: current_user.id, utility_id: params[:utility_id])
    due.paid = true
    due.save

    redirect_to property_utilities_path(current_user.current_property),
      notice: "#{due.utility.provider} bill paid."
  end

private

  def utility_params
    params.require(:utility).permit(:provider, :due_by, :cost)
  end
end
