class IssuesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def new
    @issue = Issue.new
    @property = Property.find(params[:property_id])

    respond_with(@issue, @property)
  end

  def create
    @issue = Issue.create(issue_params)
    @issue.property_id = params[:property_id]
    @issue.user_id = current_user.id

    if @issue.save
      redirect_to root_path, notice: 'Issue added successfully.'
    else
      flash[:alert] = @issue.errors.full_messages.join(', ')
      respond_with(@issue)
    end
  end

private

  def issue_params
    params.require(:issue).permit(:description)
  end
end
