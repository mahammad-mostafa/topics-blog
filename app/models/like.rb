class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :addition

  private

  def addition
    post.increment!(:likes_counter)
  end
end
