require 'rails_helper'

RSpec.describe UsersController, type: :system do
  let!(:user) do
    initializer
    user = User.first
    sign_in(user)
    user.confirm
    user
  end
  let!(:path) { user_path(user) }
  describe 'show action page' do
    it 'should display name of the user' do
      visit(path)
      expect(page).to(have_content(user.name))
    end
    it 'should display photo of the user' do
      visit(path)
      expect(find('.user img')['src']).to(eq(user.photo))
    end
    it 'should display number of posts for the user' do
      visit(path)
      expect(page).to(have_content("Posts: #{user.posts_counter}"))
    end
    it 'should display bio of the user' do
      visit(path)
      expect(page).to(have_content(user.bio))
    end
    it 'should display three posts at most for the user' do
      visit(path)
      expect(all('.user').length).to(be_between(0, 3).inclusive)
    end
    it 'should have a link to open all posts of the user' do
      visit(path)
      expect(page).to(have_content('All posts'))
    end
    it 'should open all users page with a link' do
      visit(path)
      click_link('Back')
      expect(page).to(have_current_path(users_path))
    end
    it 'should open each post show page with a link' do
      visit(path)
      find('.post').click_link('Details')
      expect(page).to(have_current_path(user_post_path(user, user.posts.first)))
    end
    it 'should open all user posts with a link' do
      visit(path)
      click_link('All posts')
      expect(page).to(have_current_path(user_posts_path(user)))
    end
  end
end
