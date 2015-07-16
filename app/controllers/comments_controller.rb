class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    #this is only for adding a comment to an ANSWER!
    @comment = Comment.new
    @id = session[:user_id]
    @answer_id = params["answer_id"]
  end

  # See Wed. night lecture comments.  We can clean this up by extracting
  # private methods to help clean things up.
  def create
    @comment = Comment.new(comment_params)
    if comment_params[:commentable_type] == "question"
      @question = Question.find_by(id: comment_params[:commentable_id])
      if @question.comments << @comment
        redirect_to :back
      else
        flash[:notice] = "There was a problem submitting your comment."
        redirect_to :back
      end
    elsif comment_params[:commentable_type] == "answer"
      @answer = Answer.find_by(id: comment_params[:commentable_id])
      if @answer.comments << @comment
        redirect_to question_path(@answer.question.id)
      else
        redirect_to :back
      end
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
    end
end
