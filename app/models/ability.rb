class Ability
  include CanCan::Ability

  def initialize(user)
    can(:read, :all)
    return unless user.present?

    can(:create, Post)
    can(:create, Comment)
    can(:create, Like)
    can(:destroy, Post, author_id: user.id)
    can(:destroy, Comment, user:)
    return unless user.admin?

    can(:destroy, Post)
    can(:destroy, Comment)
  end
end
