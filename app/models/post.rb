class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user, foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :addition
  after_destroy :subtraction
  paginates_per 3

  def recent_comments
    comments.includes(:user).order(id: :desc).limit(5)
  end

  def author=(author)
    self.user = author
  end

  private

  def addition
    user.increment!(:posts_counter)
  end

  def subtraction
    user.decrement!(:posts_counter)
  end
end
