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
    @comments = @question.comments
    @answer = Answer.new
    @answers = @question.answers
    # @user = User.find(session[:user_id])
    # !!!!!!!!  comment form needs this   <%= f.hidden_field :user_id, value: @user.id %>
    # !!!!!!!!  answer form needs this   <%= f.hidden_field :user_id, value: @user.id %>
  end

  def edit
    @question = Question.find(params[:id])
    @tags = @question.tags.map { |tag| tag.name }.join(",")
  end

  def update
    @id = session[:user_id]
    @question = Question.find(params[:id])
    @question.question_tags.clear
    @question.assign_attributes(question_params)
    if @question.update_attributes
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
      render :edit
    end
  end

  def destroy
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end
end