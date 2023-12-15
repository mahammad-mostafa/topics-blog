require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:user) do
    initializer
    user = User.first
    sign_in(user)
    user.confirm
    user
  end
  describe 'index action method' do
    it 'should return correct response status' do
      get(users_path)
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(users_path)
      expect(response).to(render_template(:index))
    end
    it 'should return correct placeholder text' do
      get(users_path)
      expect(response.body).to(include('Users list'))
    end
  end
  describe 'show action method' do
    it 'should return correct response status' do
      get(user_path(user))
      expect(response).to(have_http_status(:success))
    end
    it 'should render correct view template' do
      get(user_path(user))
      expect(response).to(render_template(:show))
    end
    it 'should return correct placeholder text' do
      get(user_path(user))
      expect(response.body).to(include('User details'))
    end
  end
end
