class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def new
  end

  def edit
  end

  def show
  end
end
