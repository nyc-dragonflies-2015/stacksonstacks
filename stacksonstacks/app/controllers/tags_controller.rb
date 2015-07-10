class TagsController < ApplicationController
  def index
    @Tags = Tag.order(created_at: :desc).page(params[:page])
  end
end
