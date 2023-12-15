require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:post) do
    initializer
    Post.first
  end
  describe 'initial object' do
    it 'should be a valid post' do
      expect(post).to(be_valid)
    end
  end
  describe 'title attribute' do
    it 'should not be blank' do
      post.title = ''
      expect(post).to_not(be_valid)
    end
    it 'should not exceed 250 characters' do
      post.title *= 100
      expect(post).to_not(be_valid)
    end
  end
  describe 'comments_counter attribute' do
    it 'should not be a string' do
      post.comments_counter = 'i'
      expect(post).to_not(be_valid)
    end
    it 'should not be smaller than zero' do
      post.comments_counter = '-1'
      expect(post).to_not(be_valid)
    end
    it 'should be an integer and greater than or equal zero' do
      post.comments_counter = 0
      expect(post).to(be_valid)
    end
  end
  describe 'likes_counter attribute' do
    it 'should not be a string' do
      post.likes_counter = 'i'
      expect(post).to_not(be_valid)
    end
    it 'should not be smaller than zero' do
      post.likes_counter = '-1'
      expect(post).to_not(be_valid)
    end
    it 'should be an integer and greater than or equal zero' do
      post.likes_counter = 0
      expect(post).to(be_valid)
    end
  end
  describe 'recent_comments method' do
    it 'should return last five comments' do
      expect(post.recent_comments).to(eq(post.comments))
    end
  end
end
