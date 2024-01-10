class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def recent_3_posts
    Post.where(author: self).order(created_at: :DESC).limit(3)
  end
end
