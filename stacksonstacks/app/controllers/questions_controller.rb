class QuestionsController < ApplicationController

  #include ApplicationHelper
  # before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
  end

  def create

  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end