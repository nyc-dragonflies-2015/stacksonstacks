class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @question = Question.find_by(id: comment_params[:commentable_id])
    if @question.comments << @comment
      redirect_to :back
    else
      flash[:notice] = "There was a problem submitting your comment."
      redirect_to :back
    end
  end



  private
    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type, :user_id)
    end
end
