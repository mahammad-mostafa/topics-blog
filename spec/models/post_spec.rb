require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'name', photo: 'photo', bio: 'bio', posts_counter: 0)
  subject { Post.new(author: user, title: 'title', text: 'text', comments_counter: 0, likes_counter: 0) }
  context 'initial object' do
    it 'subject should be a valid post' do
      expect(subject).to(be_valid)
    end
  end
  context 'title attribute' do
    it 'should not be blank' do
      subject.title = ''
      expect(subject).to_not(be_valid)
    end
    it 'should not exceed 250 characters' do
      subject.title *= 100
      expect(subject).to_not(be_valid)
    end
  end
  context 'comments_counter attribute' do
    it 'should be an integer' do
      subject.comments_counter = 'i'
      expect(subject).to_not(be_valid)
    end
    it 'should be greate than or equal zero' do
      subject.comments_counter = '-1'
      expect(subject).to_not(be_valid)
    end
  end
  context 'likes_counter attribute' do
    it 'should be an integer' do
      subject.likes_counter = 'i'
      expect(subject).to_not(be_valid)
    end
    it 'should be greate than or equal zero' do
      subject.likes_counter = '-1'
      expect(subject).to_not(be_valid)
    end
  end
  context 'recent_comments method' do
    it 'should return last five comments' do
      expect(subject.recent_comments).to(eq(subject.comments))
    end
  end
end
