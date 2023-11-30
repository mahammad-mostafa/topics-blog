class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :counter

  private

  def counter
    post.increment!(:comments_counter)
  end
end
