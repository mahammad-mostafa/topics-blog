module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!
      before_action :set_post

      def index
        @comments = @post.comments
        render json: @comments
      end

      def create
        @comment = @post.comments.new(comment_params)
        @comment.user = User.find(params[:user_id])
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      private

      def set_post
        @post = Post.find(params[:post_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
