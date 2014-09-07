class CommentsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def create
    @post = Post.find(params[:post_id])
    @forum = @post.forum
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to forum_post_path(@forum, @post), notice: 'Comment added successfully.'
    else
      flash[:alert] = @comment.errors.full_messages.join(', ')
      respond_with(@comment)
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
