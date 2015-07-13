module ApplicationHelper

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end

  def user_is_current_user(answer_or_question)
    return true if logged_in? && answer_or_question.user.id == session[:user_id]
  end

  def vote_count(questionoranswer)
    return questionoranswer.votes.where(upvote?: true).count - questionoranswer.votes.where(upvote?: false).count
  end


end
