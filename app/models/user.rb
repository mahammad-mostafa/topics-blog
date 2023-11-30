class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(id: :desc).limit(3)
  end
end