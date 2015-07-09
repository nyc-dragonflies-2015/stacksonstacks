class Comment < ActiveRecord::Base
  has_many :votes, as: :votable
  belongs_to :user
  validates :body, presence: true
end
