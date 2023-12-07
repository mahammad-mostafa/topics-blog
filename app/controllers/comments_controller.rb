class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @path = user_post_path(current_user, params[:post_id])
  end

  def create
    @comment = Comment.new(parameters)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to(user_post_path(@comment.user, @comment.post))
    else
      @path = user_post_path(current_user, params[:post_id])
      flash.now[:messages] = @comment.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  private

  def parameters
    params.require(:comment).permit(:text)
  end
end
