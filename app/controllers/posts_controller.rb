class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).where(author_id: params[:user_id]).order(id: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.comments_counter = @post.likes_counter = 0
    if @post.save
      redirect_to(user_post_path(@post.user, @post))
    else
      flash.now[:errors] = @post.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(user_posts_path(@post.user), alert: 'Post successfully deleted')
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
