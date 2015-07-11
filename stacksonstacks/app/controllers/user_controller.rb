class UserController < ApplicationController
  before_action :require_login, only: [:edit, :destroy]
  def show
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user == nil
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

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.authenticate(user_params[:password])
      @user.update(user_params)
      redirect_to @user
    else
      flash[:notice] = "Your password was incorrect"
      redirect_to :back
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    session[:user_id] = nil
    @user.destroy
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
