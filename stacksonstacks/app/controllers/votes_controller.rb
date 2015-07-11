class VotesController < ApplicationController

  def create
    p params
    user = User.find_by(id: session[:user_id])
    if user
      if params[:answer_id]
        Answer.find_by(id: params[:answer_id]).votes.create(user_id: user.id, upvote?: params[:upvote?])
      else
        Question.find_by(id: params[:question_id]).votes.create(user_id: user.id, upvote?: params[:upvote?])
      end
    else
      redirect_to :back
    end
  end

  def destroy
  end

end
