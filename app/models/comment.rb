class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    comment_counter = self.post.comments_counter
    if comment_counter.nil?
      comment_counter = 1
    else
      comment_counter += 1
    end
    self.post.update(comments_counter: comment_counter)
  end
end
