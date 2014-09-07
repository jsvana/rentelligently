class IssuesController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def new
    @issue = Issue.new
    @property = Property.find(params[:property_id])

    respond_with(@issue, @property)
  end

  def create
    @property = Property.find(params[:property_id])
    @issue = Issue.create(issue_params)
    @issue.property_id = @property.id
    @issue.user_id = current_user.id

    if @issue.save
      redirect_to @property, notice: 'Issue added successfully.'
    else
      flash[:alert] = @issue.errors.full_messages.join(', ')
      respond_with(@issue)
    end
  end

  def fix
    @property = Property.find(params[:property_id])

    @issue = Issue.find(params[:issue_id])
    @issue.fixed = true
    @issue.save

    redirect_to @property, notice: 'Issue marked as fixed.'
  end

private

  def issue_params
    params.require(:issue).permit(:description)
  end
end
