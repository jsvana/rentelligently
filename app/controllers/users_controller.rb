class UsersController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def show
    @user = User.find(params[:id])

    respond_with(@user)
  end

  def edit
    @user = User.find(params[:id])

    respond_with(@user)
  end

  def update
    @user = User.find(params[:id])

    @user.update_attributes(user_params)

    if @user.save
      redirect_to @user, notice: 'Profile updated successfully.'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      respond_with(@user)
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile)
  end
end
