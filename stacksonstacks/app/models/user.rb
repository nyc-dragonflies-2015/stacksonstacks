class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :favorite_questions
  has_many :comments
  has_many :votes
  validates :username, uniqueness: true, presence: true

end
