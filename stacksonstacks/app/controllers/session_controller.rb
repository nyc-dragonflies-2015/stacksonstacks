class SessionController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "There was something wrong with your submission"
      redirect_to :back
    end
  end

  private
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
