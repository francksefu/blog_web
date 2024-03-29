class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatables

  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  def recent_3_posts
    posts.order(created_at: :DESC).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
