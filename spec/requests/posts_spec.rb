require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:user) do
    initializer
    user = User.first
    sign_in(user)
    user.confirm
    user
  end
  describe 'index action method' do
    it 'should return correct response status' do
      get(user_posts_path(user))
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(user_posts_path(user))
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get(user_posts_path(user))
      expect(response.body).to(include('Posts list'))
    end
  end
  describe 'show action method' do
    it 'should return correct response status' do
      get(user_post_path(user, user.posts.first))
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(user_post_path(user, user.posts.first))
      expect(response).to(render_template(:show))
    end
    it 'should return correct placeholder text' do
      get(user_post_path(user, user.posts.first))
      expect(response.body).to(include('Post details'))
    end
  end
end
