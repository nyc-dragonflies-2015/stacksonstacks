class AnswersController < ApplicationController

  def create
    user = User.find_by(id: session[:user_id])
    @answer = Answer.create(answer_params)
    @answer.update_attributes(user_id: user.id)
    question = Question.find_by(id: params[:answer][:question_id])
    redirect_to question_path(question.id)
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    question = Question.find_by(id: params[:answer][:question_id])
    Answer.find_by(id: params[:id]).update_attributes(answer_params)
    redirect_to question_path(question.id)
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    question = Question.find_by(id: answer.question.id)
    answer.destroy
    redirect_to question_path(question.id)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end

end
