require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    user = User.create(id: 1, name: 'name', photo: 'https://placehold.co/100', bio: 'bio', posts_counter: 0)
    Post.create(id: 1, title: 'title', text: 'text', comments_counter: 0, likes_counter: 0, user:)
  end
  describe 'index action method' do
    it 'should return correct response status' do
      get '/users/1/posts'
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get '/users/1/posts'
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to(include('Posts list'))
    end
  end
  describe 'show action method' do
    it 'should return correct response status' do
      get '/users/1/posts/1'
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get '/users/1/posts/1'
      expect(response).to(render_template(:show))
    end
    it 'should return correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to(include('Post details'))
    end
  end
end
