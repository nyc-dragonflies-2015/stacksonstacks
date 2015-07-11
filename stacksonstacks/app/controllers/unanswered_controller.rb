class UnansweredController < ApplicationController
  def index
    @unanswered_questions = []
    Question.all.each do |q|
      @unanswered_questions << q if q.answers.empty?
    end
  end
end
