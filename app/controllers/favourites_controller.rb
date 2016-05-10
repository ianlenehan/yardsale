class FavouritesController < ApplicationController
  def index
    @favourites = Favourite.all
  end

  def new
    respond_to do |format|
      format.html {}
      format.json { render json: @response }
    end
    favourite = Favourite.new
    favourite.user_id = params[:userID]
    favourite.item_id = params[:itemID]
    favourite.save
  end

  def delete
    respond_to do |format|
      format.html {}
      format.json { render json: @response }
    end
    user_id = params[:userID]
    item_id = params[:itemID]
    favourite = Favourite.where(:user_id => user_id, :item_id => item_id).first
    favourite.destroy
  end

  def edit
  end

  def show
  end
end
