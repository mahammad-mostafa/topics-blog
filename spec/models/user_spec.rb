require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    initializer
    User.first
  end
  describe 'initial object' do
    it 'should be a valid user' do
      expect(user).to(be_valid)
    end
  end
  describe 'name attribute' do
    it 'should not be blank' do
      user.name = ''
      expect(user).to_not(be_valid)
    end
  end
  describe 'posts_counter attribute' do
    it 'should not be a string' do
      user.posts_counter = 'i'
      expect(user).to_not(be_valid)
    end
    it 'should not be smaller than zero' do
      user.posts_counter = '-1'
      expect(user).to_not(be_valid)
    end
    it 'should be an integer and greater than or equal zero' do
      user.posts_counter = 0
      expect(user).to(be_valid)
    end
  end
  describe 'recent_posts method' do
    it 'should return last three posts' do
      expect(user.recent_posts).to(eq(user.posts))
    end
  end
end
