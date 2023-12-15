module Setup
  def parameters
    { name: 'name', photo: 'https://placehold.co/100', bio: 'bio', posts_counter: 0, email: 'email@domain.com', password: 'password' }
  end

  def initializer
    user = User.create!(parameters)
    post = Post.create!(author_id: user.id, title: 'title', text: 'text', comments_counter: 0, likes_counter: 0)
    Comment.create!(user_id: user.id, post_id: post.id, text: 'text')
  end
end
