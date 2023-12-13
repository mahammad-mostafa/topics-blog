require 'rails_helper'

RSpec.describe PostsController, type: :system do
  before do
    user = User.create(id: 1, name: 'name', photo: 'https://placehold.co/100', bio: 'bio', posts_counter: 0)
    @post = Post.create(id: 1, title: 'title', text: 'text', comments_counter: 0, likes_counter: 0, user:)
    Comment.create(id: 1, text: 'text', user:, post: @post)
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
