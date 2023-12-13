require 'rails_helper'

RSpec.describe PostsController, type: :request do
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
