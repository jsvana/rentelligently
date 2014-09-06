class UtilitiesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
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

    if @utility.save
      redirect_to property_utilities_path(@property), notice: 'Utility added successfully.'
    else
      flash[:alert] = @utility.errors.full_messages.join(', ')
      respond_with(@utility)
    end
  end

private

  def utility_params
    params.require(:utility).permit(:provider, :due_by, :cost)
  end
end
