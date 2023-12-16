class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
    @path = user_post_path(current_user, params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      redirect_to(user_post_path(@comment.user, @comment.post))
    else
      @path = user_post_path(current_user, params[:post_id])
      flash.now[:errors] = @comment.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(user_post_path(@comment.user, @comment), alert: 'Comment successfully deleted')
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
