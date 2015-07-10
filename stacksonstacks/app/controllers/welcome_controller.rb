
class WelcomeController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc).page(params[:page])
  end

end
