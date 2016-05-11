class FavouritesController < ApplicationController

  def index
    favourites = Favourite.where(:user_id => @currentUser.id)
    favourites_item_ids = []
    favourites.each do |f|
      favourites_item_ids.push f.item_id
    end
    items = Item.where(:id => favourites_item_ids)
    lat = user.latitude
    long = user.longitude
    @items = items.near([lat, long], session[:radius], :units => :km)
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
    user = @currentUser
    favourites = Favourite.where(:user_id => @currentUser.id)
    favourites_item_ids = []
    favourites.each do |f|
      favourites_item_ids.push f.item_id
    end
    items = Item.where(:id => favourites_item_ids)
    lat = user.latitude
    long = user.longitude
    @items = items.near([lat, long], session[:radius], :units => :km)
  end
end
