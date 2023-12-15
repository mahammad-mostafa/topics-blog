require 'rails_helper'

RSpec.describe PostsController, type: :system do
  before do
    @post = Post.includes(:user).find(1)
  end
  describe 'index action page' do
    it 'should display name of the posts user' do
      visit('/users/1/posts')
      expect(page).to(have_content(@post.user.name))
    end
    it 'should display photo of the posts user' do
      visit('/users/1/posts')
      expect(find('.user img')['src']).to(eq(@post.user.photo))
    end
    it 'should display number of posts for the user' do
      visit('/users/1/posts')
      expect(page).to(have_content("Posts: #{@post.user.posts_counter}"))
    end
    it 'should display title of each post' do
      visit('/users/1/posts')
      expect(first('.post')).to(have_content(@post.title))
    end
    it 'should display body of each post' do
      visit('/users/1/posts')
      expect(first('.post')).to(have_content(@post.text))
    end
    it 'should display comments for each post' do
      visit('/users/1/posts')
      expect(all('.comment').length).to(be_between(0, 5).inclusive)
    end
    it 'should display number of comments for each post' do
      visit('/users/1/posts')
      expect(page).to(have_content("Comments: #{@post.comments_counter}"))
    end
    it 'should display number of likes for each post' do
      visit('/users/1/posts')
      expect(page).to(have_content("Likes: #{@post.likes_counter}"))
    end
    it 'should display pagination section' do
      visit('/users/1/posts')
      expect(find('nav')).to(have_content('Next'))
    end
    it 'should open the user page with a link' do
      visit('/users/1/posts')
      click_link('Back')
      expect(page).to(have_current_path(user_path(@post.user)))
    end
    it 'should open each post show page with a link' do
      visit('/users/1')
      first('.post').click_link('Details')
      expect(page).to(have_current_path(user_post_path(@post.user, @post)))
    end
  end
  describe 'show action page' do
    it 'should display name of the post user' do
      visit('/users/1/posts/1')
      expect(page).to(have_content(@post.user.name))
    end
    it 'should display title of the post' do
      visit('/users/1/posts/1')
      expect(page).to(have_content(@post.title))
    end
    it 'should display body of the post' do
      visit('/users/1/posts/1')
      expect(page).to(have_content(@post.text))
    end
    it 'should display number of comments for the post' do
      visit('/users/1/posts')
      expect(page).to(have_content("Comments: #{@post.comments_counter}"))
    end
    it 'should display number of likes for the post' do
      visit('/users/1/posts')
      expect(page).to(have_content("Likes: #{@post.likes_counter}"))
    end
    it 'should display names of commentors for each comment' do
      visit('/users/1/posts/1')
      expect(page).to(have_content(@post.comments.first.user.name))
    end
    it 'should display text of each comment' do
      visit('/users/1/posts/1')
      expect(page).to(have_content(@post.comments.first.text))
    end
    it 'should open the user posts page with a link' do
      visit('/users/1/posts/1')
      click_link('Back')
      expect(page).to(have_current_path(user_posts_path(@post.user)))
    end
  end
end
