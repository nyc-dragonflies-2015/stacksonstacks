class VotesController < ApplicationController

  def create
    if params[:answer_id]
      answer = Answer.find_by(id: params[:answer_id])
      if user_has_made_this_vote(answer, params[:upvote?])
        flash[:notice] = "You have already made that vote"
        redirect_to :back
      elsif user_previosly_voted_differently(answer, params[:upvote?])
        current_user.votes.where(votable_id: answer.id, votable_type: 'Answer').first.delete
        current_user.votes.where(votable_id: answer.id, votable_type: "Answer")
        answer.votes.create(user_id: current_user.id, upvote?: params[:upvote?])
        redirect_to :back
      else
        answer.votes.create(user_id: current_user.id, upvote?: params[:upvote?])
        redirect_to :back
      end
    elsif params[:question_id]
      question = Question.find_by(id: params[:question_id])
      if user_has_made_this_vote(question, params[:question_id])
        flash[:notice] = "You have already made that vote"
        return redirect_to :back
      elsif user_previosly_voted_differently(question, params[:upvote?])
        current_user.votes.where(votable_id: question.id, votable_type: 'Question').first.delete
        question.votes.create(user_id: current_user.id, upvote?: params[:upvote?])
        redirect_to :back
      else
        question.votes.create(user_id: current_user.id, upvote?: params[:upvote?])
        redirect_to :back
      end
    end
  end


  private

  def user_has_made_this_vote(questionoranswer, upvote)
    vote = questionoranswer.votes.find_by(user_id: current_user.id)
    return true if vote && vote.upvote? == upvote
  end

  def user_previosly_voted_differently(questionoranswer, upvote)
    vote = questionoranswer.votes.find_by(user_id: current_user.id)
    return true if vote && vote.upvote? != upvote
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end

end
