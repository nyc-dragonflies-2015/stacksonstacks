class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def user_has_made_this_vote(question_or_answer, upvote?)
    user_array = question_or_answer.votes.map {|vote| vote.user}
    return true if user_array.
end
