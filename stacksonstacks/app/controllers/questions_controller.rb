class QuestionsController < ApplicationController

  include ApplicationHelper
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def new
    @id = session[:user_id]
  end

  def create
    p params
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
        redirect_to question_path(@question.id)
    else
      render :new
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
    if @question == nil
      redirect_to root_path
    else
      @comment = Comment.new
      @comments = @question.comments
      @answer = Answer.new
      @answers = @question.answers
      @user = User.find(session[:user_id])
    end
  end

  def edit
    @question = Question.find(params[:id])
    @tags = @question.tags.map { |tag| tag.name }.join(",")
    @id = session[:user_id]
  end

  def update
    @id = session[:user_id]
    @question = Question.find(params[:id])
    @question.question_tags.clear
    @question.assign_attributes(question_params)
    if @question.update_attributes(question_params)
      tags = params['tags'].split(",").collect(&:strip)
      tags.each do |word|
        if Tag.exists?(name: word)
          @question.tags << Tag.find_by(name: word)
        else
          @question.tags.create(name: word)
        end
      end
        redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @question.find(params[:id]).destroy
  end

  private

  def question_params
    params.permit(:title, :body, :user_id)
  end
end