require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'name', photo: 'photo', bio: 'bio', posts_counter: 0) }
  context 'initial object' do
    it 'subject should be a valid user' do
      expect(subject).to(be_valid)
    end
  end
  context 'name attribute' do
    it 'should not be blank' do
      subject.name = ''
      expect(subject).to_not(be_valid)
    end
  end
  context 'posts_counter attribute' do
    it 'should be an integer' do
      subject.posts_counter = 'i'
      expect(subject).to_not(be_valid)
    end
    it 'should be greate than or equal zero' do
      subject.posts_counter = '-1'
      expect(subject).to_not(be_valid)
    end
  end
  context 'recent_posts method' do
    it 'should return last three posts' do
      expect(subject.recent_posts).to(eq(subject.posts))
    end
  end
end
