class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
