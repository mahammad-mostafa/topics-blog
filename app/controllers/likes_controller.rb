class LikesController < ApplicationController
  def new
    @like = Like.new(post_id: params[:post_id])
    @like.user = current_user
    flash[:errors] = @like.errors.full_messages unless @like.save
    redirect_to(user_post_path(@like.user, @like.post))
  end
end
