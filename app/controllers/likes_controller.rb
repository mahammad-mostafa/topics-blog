class LikesController < ApplicationController
  def new
    @like = Like.create(user_id: params[:user_id], post_id: params[:post_id])
    redirect_to(user_post_path(@like.user, @like.post))
  end
end
