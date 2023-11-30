class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :counter

  private

  def counter
    post.increment!(:likes_counter)
  end
end
