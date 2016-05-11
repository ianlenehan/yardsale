class ItemsController < ApplicationController

  def index
    session[:radius] += params[:km].to_i if params[:km].present?
    user = @currentUser
    if @currentUser.present? && user.current_latitude
      lat = user.current_latitude
      long = user.current_longitude
      @items = Item.near([lat, long], session[:radius], :units => :km)
    elsif @currentUser.present? && user.latitude
      lat = user.latitude
      long = user.longitude
      @items = Item.near([lat, long], session[:radius], :units => :km)
    else
      @items = Item.all
    end
    render :index, :layout => ! params[:km].present?
  end

  def reset_km
    session[:radius] = 10
    redirect_to root_path
  end

  def new
    if !@currentUser.name_first
      redirect_to edit_user_path(@currentUser)
    else
      @item = Item.new
    end
  end

  def create
    req = Cloudinary::Uploader.upload( params[:item][:image] )
    @item = Item.create item_params
    if req
      @item.image = req["url"]
    end
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    req = Cloudinary::Uploader.upload( params[:item][:image] ) if params[:item][:image]
    item = Item.find params[:id]
    item.image = req["url"] if req
    item.update item_params
    redirect_to item
  end

  def show
    @item = Item.find params[:id]
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :charity, :negotiable, :latitude, :longitude, :category_id)
  end
end
