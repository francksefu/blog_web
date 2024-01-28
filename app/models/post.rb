class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_5_comments
    comments.includes(:user).order(created_at: :DESC).limit(5)
  end
  after_destroy :update_post_destroy
  after_save :update_post_counter

  private

  def update_post_counter
    post_counter = author.posts_counter
    post_counter += 1
    User.find(author_id).update(posts_counter: post_counter)
  end

  def update_post_destroy
    post_counter = author.posts_counter
    post_counter -= 1
    User.find(author_id).update(posts_counter: post_counter)
  end
end
