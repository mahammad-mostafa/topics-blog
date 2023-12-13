require 'rails_helper'

RSpec.describe UsersController, type: :system do
  before do
    @user = User.find(1)
  end
  describe 'index action page' do
    it 'should display name of each user' do
      visit('/users')
      expect(page).to(have_content(@user.name))
    end
    it 'should display photo of each user' do
      visit('/users')
      expect(first('.user').find('img')['src']).to(eq(@user.photo))
    end
    it 'should display number of posts for each user' do
      visit('/users')
      expect(first('.user')).to(have_content("Posts: #{@user.posts_counter}"))
    end
    it 'should open each user show action page with a link' do
      visit('/users')
      first('.user').click_link('Details')
      expect(page).to(have_current_path(user_path(@user)))
    end
  end
    describe 'show action page' do
    it 'should display name of the user' do
      visit('/users/1')
      expect(page).to(have_content(@user.name))
    end
    it 'should display photo of the user' do
      visit('/users/1')
      expect(find('.user img')['src']).to(eq(@user.photo))
    end
    it 'should display number of posts for the user' do
      visit('/users/1')
      expect(page).to(have_content("Posts: #{@user.posts_counter}"))
    end
    it 'should display bio of the user' do
      visit('/users/1')
      expect(page).to(have_content(@user.bio))
    end
    it 'should display three posts at most for the user' do
      visit('/users/1')
      expect(all('.user').length).to(be_between(0, 3).inclusive)
    end
    it 'should have a link to open all posts of the user' do
      visit('/users/1')
      expect(page).to(have_content('All posts'))
    end
    it 'should open all users page with a link' do
      visit('/users/1')
      click_link('Back')
      expect(page).to(have_current_path(users_path))
    end
    it 'should open each post show page with a link' do
      visit('/users/1')
      first('.post').click_link('Details')
      expect(page).to(have_current_path(user_post_path(@user, @user.posts.first)))
    end
    it 'should open all user posts with a link' do
      visit('/users/1')
      click_link('All posts')
      expect(page).to(have_current_path(user_posts_path(@user)))
    end
  end
end
