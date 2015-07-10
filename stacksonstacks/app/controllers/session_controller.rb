class SessionController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.find_by(username: session_params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "There was something wrong with your submission"
      redirect_to :back
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.require(:user).permit(:username, :password)
    end
end
