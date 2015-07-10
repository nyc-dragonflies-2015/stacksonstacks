class UserController < ApplicationController

  def show
    @user = User.find_by(id: params[:id] )
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :reputation)
    end
end
