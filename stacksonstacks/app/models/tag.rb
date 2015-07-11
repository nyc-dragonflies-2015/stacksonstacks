class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  def self.order_tags
    return Tag.all.sort_by {|tag| tag.questions.length}
  end

end
