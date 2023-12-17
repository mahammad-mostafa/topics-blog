module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!
      before_action :set_user

      def index
        @posts = @user.posts
        render json: @posts
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
