class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_comments_counter

  private

  def update_comments_counter
    comment_counter = post.comments_counter
    if comment_counter.nil?
      comment_counter = 1
    else
      comment_counter += 1
    end
    post.update(comments_counter: comment_counter)
  end
end
