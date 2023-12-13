require 'rails_helper'

RSpec.describe UsersController, type: :request do
  before do
    User.create(id: 1, name: 'name', photo: 'https://placehold.co/100', bio: 'bio', posts_counter: 0)
  end
  describe 'index action method' do
    it 'should return correct response status' do
      get '/users/'
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get '/users/'
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get '/users/'
      expect(response.body).to(include('Users list'))
    end
  end
  describe 'show action method' do
    it 'should return correct response status' do
      get '/users/1'
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get '/users/1'
      expect(response).to(render_template(:show))
    end
    it 'should return correct placeholder text' do
      get '/users/1'
      expect(response.body).to(include('User details'))
    end
  end
end
