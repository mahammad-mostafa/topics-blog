class CommentsController < ApplicationController
  load_and_authorize_resource

  before_action :set_comment, only: [:destroy]
  before_action :set_path, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      redirect_to user_post_path(@comment.user, @comment.post), notice: 'Comment successfully created'
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(@comment.user, @comment.post), alert: 'Comment successfully deleted'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_path
    @path = user_post_path(current_user, params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
