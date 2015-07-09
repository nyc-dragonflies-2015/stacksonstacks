class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :user
  validates :body, presence: true
end
