require "will_paginate/array"
class TagsController < ApplicationController
  def index
    @tags = Tag.order_tags.paginate(page: params[:page], per_page: 20)
  end

  def show
    @tag = Tag.find_by(id: params[:id])
  end
end
