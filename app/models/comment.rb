class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comments_counter
  after_destroy :update_comments_counter

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end

  def as_json(options = {})
    super(options.merge(only: %i[id text], include: { user: { only: :name } }))
  end
end
