class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :best_answer, class_name: "Answer"
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end
