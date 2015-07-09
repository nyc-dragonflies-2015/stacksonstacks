class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :question
  has_one :best_answered_question, class_name: "Question", foreign_key: "answer_id"
  belongs_to :user
  validates :body, presence: true
end
