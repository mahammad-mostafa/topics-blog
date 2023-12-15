require 'rails_helper'

RSpec.describe PostsController, type: :system do
  let!(:post) do
    initializer
    post = Post.first
    sign_in(post.user)
    post.user.confirm
    post
  end
  let!(:path) { user_post_path(post.user, post) }
  describe 'show action page' do
    it 'should display name of the post user' do
      visit(path)
      expect(page).to(have_content(post.user.name))
    end
    it 'should display title of the post' do
      visit(path)
      expect(page).to(have_content(post.title))
    end
    it 'should display body of the post' do
      visit(path)
      expect(page).to(have_content(post.text))
    end
    it 'should display number of comments for the post' do
      visit(path)
      expect(page).to(have_content("Comments: #{post.comments_counter}"))
    end
    it 'should display number of likes for the post' do
      visit(path)
      expect(page).to(have_content("Likes: #{post.likes_counter}"))
    end
    it 'should display names of commentors for each comment' do
      visit(path)
      expect(page).to(have_content(post.comments.first.user.name))
    end
    it 'should display text of each comment' do
      visit(path)
      expect(page).to(have_content(post.comments.first.text))
    end
    it 'should open the user posts page with a link' do
      visit(path)
      click_link('Back')
      expect(page).to(have_current_path(user_posts_path(post.user)))
    end
  end
end
