require 'rails_helper'

RSpec.describe UsersController, type: :system do
  let!(:user) do
    initializer
    user = User.first
    sign_in(user)
    user.confirm
    user
  end
  describe 'index action page' do
    it 'should display name of each user' do
      visit(users_path)
      expect(page).to(have_content(user.name))
    end
    it 'should display photo of each user' do
      visit(users_path)
      expect(first('.user').find('img')['src']).to(eq(user.photo))
    end
    it 'should display number of posts for each user' do
      visit(users_path)
      expect(first('.user')).to(have_content("Posts: #{user.posts_counter}"))
    end
    it 'should open each user show action page with a link' do
      visit(users_path)
      first('.user').click_link('Details')
      expect(page).to(have_current_path(user_path(user)))
    end
  end
end
