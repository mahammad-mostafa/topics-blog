class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :addition
  after_destroy :subtraction

  private

  def addition
    post.increment!(:comments_counter)
  end

  def subtraction
    post.decrement!(:comments_counter)
  end
end
