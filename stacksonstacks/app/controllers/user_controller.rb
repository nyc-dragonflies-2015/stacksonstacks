class UserController < ApplicationController

  def show
    @user = User.find_by(id: params[:id] )
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:notice] = "There was a problem with your account info."
      redirect_to :back
    end
  end

  def update
    @user = User.find_by(id: session)
    # if @user.authenticate(params[:])

  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
