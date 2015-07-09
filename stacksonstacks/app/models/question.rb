class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  belongs_to :user
  has_many :favorite_questions
  has_many :user_favorites, through: :favorite_questions, source: "user"
  validates :title, presence: true
  validates :body, presence: true
end
