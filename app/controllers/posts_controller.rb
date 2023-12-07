class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(parameters)
    @post.user = current_user
    @post.comments_counter = @post.likes_counter = 0
    if @post.save
      redirect_to(user_post_path(@post.user, @post))
    else
      flash.now[:errors] = @post.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def parameters
    params.require(:post).permit(:title, :text)
  end
end
