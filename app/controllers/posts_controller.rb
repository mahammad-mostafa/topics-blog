class PostsController < ApplicationController
  load_and_authorize_resource except: %i[new create]

  def new
    @user = User.find_by(id: params[:user_id]) || current_user
    if @user != current_user && !current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to create a post for this user.'
    else
      @post = @user.posts.build
    end
  end

  def show; end

  def create
    @user = User.find_by(id: params[:user_id]) || current_user
    if @user != current_user && !current_user.admin?
      redirect_to root_path, alert: 'You are not authorized to create a post for this user.'
    else
      @post = @user.posts.build(post_params)
      if @post.save
        redirect_to post_path(@post), notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: users_path, notice: 'Post was successfully destroyed.')
  end

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @posts = @user ? @user.posts.includes(:comments).order('comments.created_at DESC').page(params[:page]).per(5) : Post.none
    else
      @posts = Post.all.includes(:comments).order('comments.created_at DESC').page(params[:page]).per(5)
    end
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
    return unless @post.nil?

    flash[:alert] = 'Post not found.'
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
