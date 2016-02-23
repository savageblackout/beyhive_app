class User < ActiveRecord::Base
  has_secure_password
  # has_many :posts
  # has_many :comments

  validates :email, presence: true, uniqueness: true
end
