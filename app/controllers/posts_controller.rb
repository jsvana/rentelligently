class PostsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def show
    @forum = Forum.find(params[:forum_id])
    @post = Post.find(params[:id])
    @comment = Comment.new

    respond_with(@forum, @post, @comment)
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @post = Post.new

    respond_with(@forum, @post)
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.forum_id = @forum.id

    if @post.save
      redirect_to forum_post_path(@forum, @post), notice: 'Post created successfully.'
    else
      flash[:alert] = @post.errors.full_messages.join(', ')
      respond_with(@post)
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
