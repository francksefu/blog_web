class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def update_post_counter
    post_counter = User.find(author_id).posts_counter
    if post_counter.nil?
      post_counter = 1
    else
      post_counter += 1
    end
    User.find(author_id).update(posts_counter: post_counter)
  end

  def recent_5_comments
    comments.order(created_at: :DESC).limit(5)
  end
end
