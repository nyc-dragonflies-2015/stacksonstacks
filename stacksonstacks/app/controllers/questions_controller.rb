class QuestionsController < ApplicationController

  #include ApplicationHelper
  # before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @id = session[:user_id]
  end

  def create
    # p params
    @question = Question.new(question_params)
    if @question.save
      tags = params['tags'].split(",").collect(&:strip)
      tags.each do |word|
        if Tag.exists?(name: word)
          @question.tags << Tag.find_by(name: word)
        else
          @question.tags.create(name: word)
        end
      end
        redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
    @answer = Answer.new
    @answers = Answer.all
    # @user = User.find(session[:user_id])
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