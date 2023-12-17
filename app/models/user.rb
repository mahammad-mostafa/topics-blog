class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def recent_posts
    posts.order(id: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end
