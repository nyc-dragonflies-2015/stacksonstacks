class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  def order_tags
    return Tags.all.sort_by {|tag| tag.questions.length}
  end

end
