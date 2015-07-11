class TagsController < ApplicationController
  def index
    @Tags = order_tags
  end
end
