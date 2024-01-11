class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_likes_counter

  private

  def update_likes_counter
    like_counter = post.likes_counter
    like_counter += 1
    post.update(likes_counter: like_counter)
  end
end
