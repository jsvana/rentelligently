class ForumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def index
    @forums = Forum.all

    respond_with(@forums)
  end

  def show
    @forum = Forum.find(params[:id])

    respond_with(@forum)
  end
end
