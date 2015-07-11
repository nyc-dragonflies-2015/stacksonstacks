class TagsController < ApplicationController
  def index
    @Tags = Tag.order_tags
  end
end
