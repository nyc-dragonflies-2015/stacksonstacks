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

end
