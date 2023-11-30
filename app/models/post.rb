class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes
  after_save :counter

  def recent_comments
    comments.order(id: :desc).limit(5)
  end

  def author=(author)
    self.user = author
  end

  private

  def counter
    user.increment!(:posts_counter)
  end
end
